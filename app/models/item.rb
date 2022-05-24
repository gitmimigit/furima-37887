class Item < ApplicationRecord
  validates :image, presence: true
  validates :item_name, presence: true
  validates :describe, presence: true
  validates :category_id, numericality: { other_than: 1 , message: "を選択してください" }
  validates :status_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :fee_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :source_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :duration_id, numericality: { other_than: 1 , message: "を選択してください"}
  validates :price, presence: true, numericality: { only_integer: true, message: "は半角数字で入力してください"}
  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, message: "は¥300~¥9999999で設定してください" }

  belongs_to :user
  has_one_attached :image
  has_one :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :fee
  belongs_to :source
  belongs_to :duration
end
