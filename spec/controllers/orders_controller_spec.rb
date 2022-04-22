require "rails_helper"

RSpec.describe OrdersController, type: :controller do
  before :each do
    @customer = FactoryBot.create(:customer)
  end

  describe "GET #index" do
    it "assigns the requested orders to @orders" do
      order = FactoryBot.create(:order)
      get :index
      expect(assigns(:orders)).to match_array([order])
    end
    it "renders the :index template" do
      order = FactoryBot.create(:order)
      get :index
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the requested orders to @order" do
      menu_item = FactoryBot.create(:menu_item)
      order = FactoryBot.create(:order)
      orderDetail = FactoryBot.create(:order_detail)
      get :show, params: { id: order }
      expect(assigns(:order)).to eq order
    end
    it "renders the :show template" do
      order = FactoryBot.create(:order)
      get :show, params: { id: order }
      expect(response).to render_template :show
    end
  end

  describe "GET #new" do
    it "assigns a new Order to @order" do
      get :new
      expect(assigns(:order)).to be_a_new(Order)
    end

    it "renders the :new template" do
      get :new
      expect(:response).to render_template :new
    end
  end

  describe "GET #edit" do
    it "assigns the requested menu item to @order" do
      order = FactoryBot.create(:order)
      get :edit, params: { id: order }
      expect(assigns(:order)).to eq order
    end

    it "renders the :edit template" do
      order = FactoryBot.create(:order)
      get :edit, params: { id: order }
      expect(response).to render_template :edit
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      before :each do
        menu_item = FactoryBot.create(:menu_item)
      end

      it "saves the new menu item in db" do
        expect {
          post :create, params: { order: attributes_for(:order),
                                  details: [{ "menu_item_id" => "1", "quantity" => "2" }] }
        }.to change(Order, :count).by(1).and change(OrderDetail, :count).by(1)
      end

      it "calculate the correct total price" do
        post :create, params: { order: attributes_for(:order),
                                details: [{ "menu_item_id" => "1", "quantity" => "2" }] }
        expect(assigns(:order)[:total]).to eq(30000.0)
      end

      it "redirects to orders#show" do
        post :create, params: { order: attributes_for(:order),
                                details: [{ "menu_item_id" => "1", "quantity" => "2" }] }
        expect(response).to redirect_to(orders_path)
      end
    end

    context "with invalid attributes" do
      it "does not add new menu item db" do
        expect { post :create, params: { order: attributes_for(:invalid_order) } }.not_to change(Order, :count)
      end

      it "re-renders the :edit template" do
        post :create, params: { order: attributes_for(:invalid_order) }
        expect(response).to render_template :new
      end
    end
  end

  describe "PATCH #update" do
    before :each do
      menu_item = FactoryBot.create(:menu_item)
      @order = FactoryBot.create(:order)
    end
    context "with valid attributes" do
      it "locates the menu item" do
        patch :update, params: { id: @order, order: attributes_for(:order) }
        expect(assigns(:order)).to eq(@order)
      end

      it "changes @order " do
        updated_order = attributes_for(:order, status: "PAID")
        patch :update, params: { id: @order, order: updated_order }
        @order.reload
        expect(@order[:status]).to eq("PAID")
      end

      it "redirects to orders#show" do
        patch :update, params: { id: @order, order: attributes_for(:order) }
        expect(response).to redirect_to(@order)
      end
    end

    context "with invalid attributes" do
      it "does not add edited status to db" do
        @order = FactoryBot.create(:order, status: "CANCELED")
        patch :update, params: { id: @order, order: attributes_for(:invalid_order, status: "FREE") }
        expect(@order[:status]).to eq("CANCELED")
      end

      it "re-renders the :edit template" do
        patch :update, params: { id: @order, order: attributes_for(:invalid_order, status: "FREE") }
        expect(response).to render_template :edit
      end
    end
  end
end
