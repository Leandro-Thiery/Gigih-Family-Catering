class Order < ApplicationRecord
  validates :customer_id, presence: true
  validates :total, numericality: true, allow_nil: true
  validates :status, presence: true, inclusion: { in: %w{NEW PAID CANCELED} }
  has_many :order_details
  has_many :menu_items, :through => :order_details
  belongs_to :customer
  validates_associated :customer, presence: true
end
