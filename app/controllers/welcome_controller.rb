class WelcomeController < ApplicationController
  before_filter :authenticate_user!

  def index
    @saved_searches = [ 'commodore', 'dreamcast' ]
  end

  # TODO: Put username and pass into DB table
  def search
    account = Goodwill::Account.new('brandonburnett', 'butthat1')
    ignored = current_user.ignored_items.map { |i| i.itemid }
    results = account.search(params[:search])
    render json: { data: results.delete_if { |f| ignored.include? f.itemid } }
  end

  def in_progress
    account = Goodwill::Account.new('brandonburnett', 'butthat1')
    render json: { data: account.in_progress }
  end

  def settings
    binding.pry
  end
end
