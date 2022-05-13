class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :describe, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :fee_id, presence: true
  validates :source_id, presence: true
  validates :duration_id, presence: true
  validates :price, presence: true
end
