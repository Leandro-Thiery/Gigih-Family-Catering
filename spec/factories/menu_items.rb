FactoryBot.define do
  factory :menu_item do
    name { Faker::Food.dish }
    price { 15000.0 }
    description { Faker::Food.description[0..149] }
  end
end
