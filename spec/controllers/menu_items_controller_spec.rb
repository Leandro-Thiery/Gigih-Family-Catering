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

  describe 'GET #show' do
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

  describe 'GET #new' do
    it 'assigns a new MenuItem to @menu_item' do
      get :new
      expect(assigns(:menu_item)).to be_a_new(MenuItem)
    end

    it 'renders the :new template' do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested menu item to @menu_item' do
      menu_item = FactoryBot.create(:menu_item)
      get :edit, params: { id: menu_item }
      expect(assigns(:menu_item)).to eq menu_item
    end

    it 'renders the :edit template' do
      menu_item = FactoryBot.create(:menu_item)
      get :edit, params: { id: menu_item }
      expect(response).to render_template :edit
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'saves the new menu item in db' do
        expect { post :create, params: { menu_item: attributes_for(:menu_item) } }
          .to change(MenuItem, :count).by(1)
      end
    end
  end

end