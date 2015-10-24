class SnipesController < ApplicationController
  def index
    @snipes = Snipe.all
    render json: @snipes
  end

  def create
    @snipe = Snipe.new(params[:data].symbolize_keys)
    @snipe.save
    render json: @snipe
  end

  def show
    @snipe = Snipe.find(params[:id])
    render json: @snipe
  end
end
