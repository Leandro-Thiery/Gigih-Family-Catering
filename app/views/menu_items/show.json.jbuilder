json.id @menu_item.id
json.name @menu_item.name
json.price @menu_item.price
json.description @menu_item.description
json.categories do
  json.array! @menu_item.categories.pluck(:name)
end
