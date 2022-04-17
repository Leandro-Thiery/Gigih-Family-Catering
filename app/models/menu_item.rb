class MenuItem < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01 }
    validates :description, length: { maximum: 150 }
    has_many :item_categories
    has_many :categories, :through => :item_categories
    validates_associated :categories, presence: true
end
