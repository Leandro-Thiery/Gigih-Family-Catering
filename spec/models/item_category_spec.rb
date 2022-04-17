require 'rails_helper'

RSpec.describe ItemCategory, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
  it 'is valid with item_id and category_id' do
    category = FactoryBot.create(:category)
    menuItem = FactoryBot.create(:menu_item)
    itemCategory = FactoryBot.build(:item_category)
    expect(itemCategory).to be_valid
  end

  it 'is invalid without an item_id' do
    itemCategory = FactoryBot.build(:item_category, menu_item_id: nil)
    expect(itemCategory).to be_invalid
    expect(itemCategory.errors[:menu_item_id]).to include("can't be blank")
  end

  it 'is invalid without a category_id' do
    itemCategory = FactoryBot.build(:item_category, category_id: nil)
    expect(itemCategory).to be_invalid
    expect(itemCategory.errors[:category_id]).to include("can't be blank")
  end
end
