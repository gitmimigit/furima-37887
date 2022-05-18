class OrderDeliverie
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :source_id, :city, :address_line1, :address_line2, :number, :order
  
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :source_id
    validates :city
    validates :address_line1
    validates :number, numericality: { only_integer: true, message: 'is invalid. Input only number'},{greater_than_or_equal_to: 10, message: 'number is too short'}
  end
end