class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def ignore_item
    auctions = current_user.auctions.where(params['data'].symbolize_keys)
    auctions.each do |auction|
      auction.ignore = true
      auction.save
    end
    render json: { data: auctions }
  end

  def index
    @saved_searches = current_user.settings(:dashboard).saved_searches
  end


  def in_progress
    if current_user.bidding_auctions.empty?
      logger.info("Getting in progress auctions from ShopGoodwill.com")
      account = Goodwill::Account.new(view_context.gw_user, view_context.gw_pass)
      results = account.in_progress
      results.each do |result|
        bidding_auction = current_user.bidding_auctions.create(result.to_hash)
        bidding_auction.save
      end
    else
      logger.info("Getting in progress auctions from database")
      results = current_user.bidding_auctions
    end
    render json: { data: results }
  end

  def search
    if current_user.auctions.where(searchterm: params[:search]).empty?
      logger.info("Getting search results for #{params[:search]} from ShopGoodwill.com")
      account = Goodwill::Account.new(view_context.gw_user, view_context.gw_pass)
      auctions = account.search(params[:search])
      auctions.each do |auction|
        new_auction = current_user.auctions.create(auction.to_hash)
        new_auction.searchterm = params[:search]
        new_auction.save
      end
      results = current_user.auctions
    else
      logger.info("Getting search results for #{params[:search]} from database")
      results = current_user.auctions.where(searchterm: params[:search], ignore: false)
    end
    render json: { data: results }
  end

  def seen_item
    auctions = current_user.auctions.where(params['data'].symbolize_keys)
    auctions.each do |auction|
      auction.seen = true
      auction.save
    end
    render json: { data: auctions }
  end

  def settings
    @saved_searches = current_user.settings(:dashboard).saved_searches
    @gw_user = current_user.settings(:dashboard).gw_user
  end

  def settings_save
    saved_searches = params[:saved_searches].split(',').sort
    current_user.settings(:dashboard).saved_searches = saved_searches
    current_user.settings(:dashboard).gw_user = params[:gw_user]
    current_user.settings(:dashboard).gw_pass = params[:gw_pass]
    current_user.save
    redirect_to('welcome#settings')
  end
end
