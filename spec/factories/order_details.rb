FactoryBot.define do
  factory :order_detail do
    order_id { 1 }
    menu_item_id { 1 }
    item_price { 15000.0 }
    quantity { 1 }
  end
  factory :new_order_detail, parent: :order_detail do
    menu_item_id { 1 }
    quantity { 2 }
  end
end
