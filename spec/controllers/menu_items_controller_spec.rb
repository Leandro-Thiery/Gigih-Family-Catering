require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do

  describe 'GET #index' do
    it 'assigns the requested menu items to @menu_items' do
      menu_item = FactoryBot.create(:menu_item)
      get :index
      expect(assigns(:menu_items)).to include(menu_item)
    end
    it 'renders the :show template' do
      menu_item = FactoryBot.create(:menu_item)
      get :index
      expect(response).to render_template :index
    end
  end
end