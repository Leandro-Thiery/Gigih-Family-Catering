class Category < ApplicationRecord
    validates :name, presence: true, uniqueness: true
    has_many :item_categories
    has_many :menu_items, :through => :item_categories
end
