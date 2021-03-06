json.id @order.id
json.total @order.total
json.status @order.status
json.name @order.customer.name
json.email @order.customer.email
json.order_details @order.order_details do |order_detail|
  json.item_name order_detail.menu_item.name
  json.categories do
    json.array! order_detail.menu_item.categories.pluck(:name)
  end
  json.price order_detail.item_price
  json.quantity order_detail.quantity
end
