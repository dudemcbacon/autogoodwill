class WelcomeController < ApplicationController
  def index
  end

  def search
    account = Goodwill::Account.new('brandonburnett', 'butthat1')
    ignored = IgnoredItem.all.map { |i| i.itemid }
    results = account.search(params[:search])
    render json: { data: results.delete_if { |f| ignored.include? f.itemid } }
  end

  def in_progress
    account = Goodwill::Account.new('brandonburnett', 'butthat1')
    @inprogress = account.in_progress
    render json: { data: @inprogress }
  end
end
