class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :describe, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" }
  validates :status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :fee_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :source_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :duration_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :price, presence: true, numericality: { message: "is invalid. Input half-width characters"}
  
  with_options format: { with: /[3-9][0-9][0-9]|[0-9]{4,7}/, message: 'is out of setting range' } do
    validates :price
  end

  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :source
  belongs_to :duration
end
