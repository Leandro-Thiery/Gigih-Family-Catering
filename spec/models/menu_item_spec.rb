require 'rails_helper'

RSpec.describe MenuItem, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  context "using factory" do
    it 'is valid with a name and a price using factory' do
      menuItem = FactoryBot.build(:menu_item)
      expect(menuItem).to be_valid
    end

    it 'is invalid without name' do
      menuItem = FactoryBot.build(:menu_item, name: nil)
      expect(menuItem).to be_invalid
      expect(menuItem.errors[:name]).to include("can't be blank")
    end

    it 'is invalid wihout price' do
      menuItem = FactoryBot.build(:menu_item, price: nil)
      expect(menuItem).to be_invalid
      expect(menuItem.errors[:price]).to include("can't be blank")
    end

    it 'is invalid with duplicate name' do 
      menuItem1 = FactoryBot.create(:menu_item, name: "Nasi Uduk")
      menuItem2 = FactoryBot.build(:menu_item, name: "Nasi Uduk")
      expect(menuItem2).to be_invalid
      expect(menuItem2.errors[:name]).to include("has already been taken")
    end

    it 'is invalid with a price less than 0.01' do
      menuItem = FactoryBot.build(:menu_item, price: 0.009)
      expect(menuItem).to be_invalid
    end
    pending "add test for having at least one category"

  end
end
