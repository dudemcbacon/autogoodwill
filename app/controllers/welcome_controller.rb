class WelcomeController < ApplicationController
  def index
    logger.info "You are in index"
  end

  def search
    logger.info "You are in search"
    account = Goodwill::Account.new('brandonburnett', 'butthat1')
    @results = account.search(params[:welcome][:search])
    @ignoreditems = IgnoredItem.all
  end

  def ignore
    binding.pry
  end
end
