class Order < ApplicationRecord
  validates :customer_id, presence: true
  validates :total, numericality: true, allow_nil: true
  validates :status, presence: true, inclusion: { in: %w{NEW PAID CANCELED} }
  has_many :order_details
  has_many :menu_items, :through => :order_details
  belongs_to :customer
  validates_associated :customer, presence: true
  scope :filter_by_email, ->(email) { joins(:customer).where("customer.email = ?", email) }
  scope :filter_by_min_price, ->(min_price) { where("total >= ?", min_price) }
  scope :filter_by_max_price, ->(max_price) { where("total <= ?", max_price) }
  scope :filter_by_start_date, ->(start_date) { where("updated_at >= ?", start_date.to_time) }
  scope :filter_by_end_date, ->(end_date) { where("updated_at <= ?", end_date.to_time) }
end
