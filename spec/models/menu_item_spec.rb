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

    
    pending "add test for having at least one category"

  end
end
