json.orders @orders do |order|
  json.id order.id
  json.total order.total
  json.status order.status
  json.name order.customer.name
  json.email order.customer.email
end
