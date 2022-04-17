class ItemCategory < ApplicationRecord
    validates :menu_item_id, presence: true
    validates :category_id, presence: true
    belongs_to :category
    belongs_to :menu_item
    validates_associated :category, presence: true
    validates_associated :menu_item, presence: true
end
