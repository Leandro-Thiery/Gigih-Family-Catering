class MenuItemsController < ApplicationController

    def index
        @menu_items = MenuItem.all
    end

    def show
    end
end