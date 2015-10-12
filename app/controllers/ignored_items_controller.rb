class IgnoredItemsController < ApplicationController
  def index
    @ignoreditems = IgnoredItem.all
  end

  def create
    @ignoreditem = IgnoredItem.new(params[:data].symbolize_keys)
    @ignoreditem.save
    redirect_to @ignoreditem
  end

  def show
    @ignoreditem = IgnoredItem.find(params[:id])
  end
end
