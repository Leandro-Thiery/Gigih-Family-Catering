# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Customer.create(name: "Leandro", email: "leandro@gmail.com")
Order.create(customer_id: 1, total: 10000.0)
Category.create(name: "Makanan")
MenuItem.create(name: "Nasi Uduk", price: 10000.0)
ItemCategory.create(menu_item_id: 1, category_id: 1)
OrderDetail.create(menu_item_id: 1, item_price: 10000.0, quantity: 1, order_id: 1)
