require 'rails_helper'

RSpec.describe Category, type: :model do
  pending "add test for relation with MenuItem"
  it 'is valid with a name' do
    category = FactoryBot.build(:category)
    expect(category).to be_valid
  end

  it 'is invalid without a name' do
    category = FactoryBot.build(:category, name: nil)
    expect(category).to be_invalid
    expect(category.errors[:name]).to include("can't be blank")
  end

  it 'is invalid with a duplicate name' do
    category1 = FactoryBot.create(:category, name: "Food")
    category2 = FactoryBot.build(:category, name: "Food")
    expect(category2).to be_invalid
    expect(category2.errors[:name]).to include("has already been taken")
  end
end
