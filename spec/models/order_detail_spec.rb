require "rails_helper"

RSpec.describe OrderDetail, type: :model do
  before :each do
    customer = FactoryBot.create(:customer)
    order = FactoryBot.create(:order)
  end

  it "is valid with order and item id" do
    menuItem = FactoryBot.create(:menu_item)
    orderDetail = FactoryBot.build(:order_detail)
    expect(orderDetail).to be_valid
  end

  it "is invalid without an menu_item_id" do
    orderDetail = FactoryBot.build(:order_detail, menu_item_id: nil)
    expect(orderDetail).to be_invalid
    expect(orderDetail.errors[:menu_item_id]).to include("can't be blank")
  end

  it "is invalid without a order_id" do
    orderDetail = FactoryBot.build(:order_detail, order_id: nil)
    expect(orderDetail).to be_invalid
    expect(orderDetail.errors[:order_id]).to include("can't be blank")
  end

  it "is invalid with item_price less than 0.01" do
    orderDetail = FactoryBot.build(:order_detail, item_price: 0.009)
    expect(orderDetail).to be_invalid
    expect(orderDetail.errors[:item_price]).to include("must be greater than or equal to 0.01")
  end

  it "is invalid with wrong item_price type" do
    orderDetail = FactoryBot.build(:order_detail, item_price: "A")
    expect(orderDetail).to be_invalid
    expect(orderDetail.errors[:item_price]).to include("is not a number")
  end

  it "is invalid with quantity less than 1" do
    orderDetail = FactoryBot.build(:order_detail, quantity: 0)
    expect(orderDetail).to be_invalid
    expect(orderDetail.errors[:quantity]).to include("must be greater than 0")
  end

  it "is invalid with wrong quantity type" do
    orderDetail = FactoryBot.build(:order_detail, quantity: "A")
    expect(orderDetail).to be_invalid
    expect(orderDetail.errors[:quantity]).to include("is not a number")
  end
end
