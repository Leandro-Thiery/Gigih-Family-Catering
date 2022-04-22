json.orders @menu_items do |menu_item|
  json.id menu_item.id
  json.name menu_item.name
  json.price menu_item.price
  json.description menu_item.description
end
