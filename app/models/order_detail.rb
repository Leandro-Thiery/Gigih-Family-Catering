class OrderDetail < ApplicationRecord
  validates :order_id, presence: true
  validates :menu_item_id, presence: true
  validates :item_price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
  validates :quantity, presence: true, numericality: { greater_than: 0 }
  belongs_to :order
  belongs_to :menu_item
  validates_associated :order, presence: true
end
