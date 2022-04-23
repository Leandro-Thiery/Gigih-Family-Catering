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
    @menu_item = MenuItem.new(
      name: params[:name],
      description: params[:description],
      price: params[:price],
    )
    if @menu_item.save
      redirect_to menu_items_path
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  def update
    @menu_item = MenuItem.find(params[:id])
    if @menu_item.update(
      name: params[:name],
      description: params[:description],
      price: params[:price],
    )
      redirect_to menu_item_path
    else
      render json: @menu_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @menu_item = MenuItem.find(params[:id])
    @menu_item.destroy
    redirect_to menu_items_path
  end
end
