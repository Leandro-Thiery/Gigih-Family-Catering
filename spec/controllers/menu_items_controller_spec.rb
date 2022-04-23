require "rails_helper"

RSpec.describe MenuItemsController, type: :controller do
  describe "GET #index" do
    it "assigns the requested menu items to @menu_items" do
      menu_item = FactoryBot.create(:menu_item)
      get :index
      expect(assigns(:menu_items)).to match_array([menu_item])
    end
    it "renders the :index template" do
      menu_item = FactoryBot.create(:menu_item)
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested menu items to @menu_item" do
      menu_item = FactoryBot.create(:menu_item)
      get :show, params: { id: menu_item }
      expect(assigns(:menu_item)).to eq menu_item
    end
    it "renders the :show template" do
      menu_item = FactoryBot.create(:menu_item)
      get :show, params: { id: menu_item }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new MenuItem to @menu_item" do
      get :new
      expect(assigns(:menu_item)).to be_a_new(MenuItem)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested menu item to @menu_item" do
      menu_item = FactoryBot.create(:menu_item)
      get :edit, params: { id: menu_item }
      expect(assigns(:menu_item)).to eq menu_item
    end

    it "renders the :edit template" do
      menu_item = FactoryBot.create(:menu_item)
      get :edit, params: { id: menu_item }
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new menu item in db" do
        expect { post :create, params: attributes_for(:menu_item) }.to change(MenuItem, :count).by(1)
      end

      it "redirects to menu_items#show" do
        post :create, params: attributes_for(:menu_item)
        expect(response).to redirect_to(menu_items_path)
      end
    end

    context "with invalid attributes" do
      it "does not add new menu item db" do
        expect { post :create, params: attributes_for(:invalid_menu_item) }.not_to change(MenuItem, :count)
      end

      it "return json response" do
        post :create, params: attributes_for(:invalid_menu_item)
        json_body = JSON.parse(response.body)
        expect(json_body["name"]).to include("can't be blank")
        expect(json_body["price"]).to include("is not a number")
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @menu_item = FactoryBot.create(:menu_item)
    end
    context "with valid attributes" do
      it "locates the menu item" do
        patch :update, params: { id: @menu_item, menu_item: attributes_for(:menu_item) }
        expect(assigns(:menu_item)).to eq(@menu_item)
      end

      it "changes @menu_item " do
        updated_menu_item = attributes_for(:menu_item, name: "Fried Chicken")
        patch :update, params: { id: @menu_item, name: "Fried Chicken", price: @menu_item }
        @menu_item.reload
        expect(@menu_item.name).to eq("Fried Chicken")
      end

      it "redirects to menu_items#show" do
        patch :update, params: { id: @menu_item, name: "Fried Chicken", price: @menu_item }
        expect(response).to redirect_to(@menu_item)
      end
    end

    context "with invalid attributes" do
      it "does not add edited menu item db" do
        @menu_item = FactoryBot.create(:menu_item, name: "Fried Chicken")
        patch :update, params: { id: @menu_item, name: nil, price: nil }
        expect(@menu_item.name).to eq("Fried Chicken")
      end

      it "return json response" do
        patch :update, params: { id: @menu_item, name: nil, price: nil }
        json_body = JSON.parse(response.body)
        expect(json_body["name"]).to include("can't be blank")
        expect(json_body["price"]).to include("is not a number")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @menu_item = FactoryBot.create(:menu_item)
    end

    it "deletes the food from the database" do
      expect {
        delete :destroy, params: { id: @menu_item }
      }.to change(MenuItem, :count).by(-1)
    end

    it "redirects to foods#index" do
      delete :destroy, params: { id: @menu_item }
      expect(response).to redirect_to menu_items_path
    end
  end
end
