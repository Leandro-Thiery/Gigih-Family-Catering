require "rails_helper"

RSpec.describe Order, type: :model do
  it "is valid with a customer_id and total" do
    customer = FactoryBot.create(:customer)
    order = FactoryBot.build(:order)
    expect(order).to be_valid
  end

  it "is invalid without a customer_id" do
    order = FactoryBot.build(:order, customer_id: nil)
    expect(order).to be_invalid
    expect(order.errors[:customer_id]).to include("can't be blank")
  end

  it "is invalid with wrong total type" do
    order = FactoryBot.build(:order, total: "A")
    expect(order).to be_invalid
    expect(order.errors[:total]).to include("is not a number")
  end

  describe "self#by_letter" do
    context "with matching letter" do
      it "should return a sorted array of results that match" do
        order1 = FactoryBot.create(:order, name: "Nasi Uduk")
        order2 = FactoryBot.create(:order, name: "Kerak Telor")
        order3 = FactoryBot.create(:order, name: "Nasi Semur Jengkol")

        expect(order.by_letter("N")).to eq([order3, order1])
      end
    end
  end
end
