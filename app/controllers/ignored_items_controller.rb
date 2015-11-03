class IgnoredItemsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @ignoreditems = IgnoredItem.all
  end

  def create
    @ignoreditem = current_user.ignored_items.create(params[:data].symbolize_keys)
    @ignoreditem.save
    redirect_to @ignoreditem
  end

  def show
    @ignoreditem = IgnoredItem.find(params[:id])
  end
end
