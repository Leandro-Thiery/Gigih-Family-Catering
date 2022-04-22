FactoryBot.define do
  factory :order do
    customer_id { 1 }
    total { 30000.0 }
  end
  factory :invalid_order, parent: :order do
    customer_id { nil }
  end
end
