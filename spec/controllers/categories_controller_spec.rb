require "rails_helper"

RSpec.describe CategoriesController, type: :controller do
  describe "GET #index" do
    it "assigns the requested categories to @categories" do
      category = FactoryBot.create(:category)
      get :index
      expect(assigns(:categories)).to match_array([category])
    end
    it "renders the :index template" do
      category = FactoryBot.create(:category)
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested categories to @category" do
      category = FactoryBot.create(:category)
      get :show, params: { id: category }
      expect(assigns(:category)).to eq category
    end
    it "renders the :show template" do
      category = FactoryBot.create(:category)
      get :show, params: { id: category }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Category to @category" do
      get :new
      expect(assigns(:category)).to be_a_new(Category)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested menu item to @category" do
      category = FactoryBot.create(:category)
      get :edit, params: { id: category }
      expect(assigns(:category)).to eq category
    end

    it "renders the :edit template" do
      category = FactoryBot.create(:category)
      get :edit, params: { id: category }
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "saves the new menu item in db" do
        expect { post :create, params: attributes_for(:category) }.to change(Category, :count).by(1)
      end

      it "redirects to categories#show" do
        post :create, params: attributes_for(:category)
        expect(response).to redirect_to(categories_path)
      end
    end

    context "with invalid attributes" do
      it "does not add new menu item db" do
        expect { post :create, params: attributes_for(:invalid_category) }.not_to change(Category, :count)
      end

      it "return json response" do
        post :create, params: attributes_for(:invalid_category)
        json_body = JSON.parse(response.body)
        expect(json_body["name"]).to include("can't be blank")
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      @category = FactoryBot.create(:category)
    end
    context "with valid attributes" do
      it "locates the menu item" do
        patch :update, params: { id: @category, category: attributes_for(:category) }
        expect(assigns(:category)).to eq(@category)
      end

      it "changes @category " do
        updated_category = attributes_for(:category, name: "Fried Chicken")
        patch :update, params: { id: @category, name: "Fried Chicken", price: @category }
        @category.reload
        expect(@category.name).to eq("Fried Chicken")
      end

      it "redirects to categories#show" do
        patch :update, params: { id: @category, name: "Fried Chicken", price: @category }
        expect(response).to redirect_to(@category)
      end
    end

    context "with invalid attributes" do
      it "does not add edited menu item db" do
        @category = FactoryBot.create(:category, name: "Fried Chicken")
        patch :update, params: { id: @category, name: nil, price: nil }
        expect(@category.name).to eq("Fried Chicken")
      end

      it "return json response" do
        patch :update, params: { id: @category, name: nil, price: nil }
        json_body = JSON.parse(response.body)
        expect(json_body["name"]).to include("can't be blank")
      end
    end
  end

  describe "DELETE #destroy" do
    before :each do
      @category = FactoryBot.create(:category)
    end

    it "deletes the food from the database" do
      expect {
        delete :destroy, params: { id: @category }
      }.to change(Category, :count).by(-1)
    end

    it "redirects to foods#index" do
      delete :destroy, params: { id: @category }
      expect(response).to redirect_to categories_path
    end
  end
end
