require 'rails_helper'

RSpec.describe MenuItemsController, type: :controller do

  describe 'GET #index' do
    it 'assigns the requested menu items to @menu_items' do
      menu_item = FactoryBot.create(:menu_item)
      get :index
      expect(assigns(:menu_items)).to match_array([menu_item])
    end
    it 'renders the :index template' do
      menu_item = FactoryBot.create(:menu_item)
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'Get #show' do
    it 'assigns the requested menu items to @menu_item' do
      menu_item = FactoryBot.create(:menu_item)
      get :show, params: { id: menu_item }
      expect(assigns(:menu_item)).to eq menu_item
    end
    it 'renders the :show template' do
      menu_item = FactoryBot.create(:menu_item)
      get :show, params: { id: menu_item }
      expect(response).to render_template :show
    end
  end
end