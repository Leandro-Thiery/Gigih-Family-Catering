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
  end
end
