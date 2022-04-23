# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Customer.create(name: "Leandro", email: "leandro@gmail.com")
Customer.create(name: "Thiery", email: "thiery@gmail.com")
Category.create(name: "Makanan")
Category.create(name: "Minuman")
Category.create(name: "Lokal")
MenuItem.create(name: "Nasi Uduk", price: 10000.0)
MenuItem.create(name: "Es Teh", price: 5000.0)
ItemCategory.create(menu_item_id: 1, category_id: 1)
ItemCategory.create(menu_item_id: 1, category_id: 3)
ItemCategory.create(menu_item_id: 2, category_id: 2)
Order.create(customer_id: 1, total: 15000.0)
Order.create(customer_id: 2, total: 20000.0)
OrderDetail.create(menu_item_id: 1, item_price: 10000.0, quantity: 1, order_id: 1)
OrderDetail.create(menu_item_id: 2, item_price: 5000.0, quantity: 1, order_id: 1)
OrderDetail.create(menu_item_id: 1, item_price: 10000.0, quantity: 2, order_id: 2)
