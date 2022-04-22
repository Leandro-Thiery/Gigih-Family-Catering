require 'rails_helper'

RSpec.describe Customer, type: :model do
  it 'is valid with a name and an email using factory' do
    customer = FactoryBot.build(:customer)
    expect(customer).to be_valid
  end

  it 'is invalid without name' do
    customer = FactoryBot.build(:customer, name: nil)
    expect(customer).to be_invalid
    expect(customer.errors[:name]).to include("can't be blank")
  end

  it 'is invalid wihout email' do
    customer = FactoryBot.build(:customer, email: nil)
    expect(customer).to be_invalid
    expect(customer.errors[:email]).to include("can't be blank")
  end

  it 'is invalid wihout a valid email' do
    customer = FactoryBot.build(:customer, email: 'apple@')
    expect(customer).to be_invalid
    expect(customer.errors[:email]).to include("is invalid")
  end

end
