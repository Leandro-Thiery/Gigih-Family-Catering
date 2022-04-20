class MenuItemsController < ApplicationController

  def index
    @menu_items = MenuItem.all
  end

  def show
    @menu_item = MenuItem.find(params[:id])
  end

  def new
    @menu_item = MenuItem.new
  end

  def edit
    @menu_item = MenuItem.find(params[:id])
  end

  def create
    @menu_item = MenuItem.new(menu_item_params)
    @menu_item.save
  end

  private

  def menu_item_params
    params.require(:menu_item).permit(:name, :description, :price)
  end
end