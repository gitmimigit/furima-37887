class OrderDelivery
  include ActiveModel::Model
  attr_accessor :item_id, :user_id, :postal_code, :source_id, :city, :address_line1, :address_line2, :number
  attr_accessor :price, :token
  
  with_options presence: true do
    validates :item_id
    validates :user_id
    validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :source_id, numericality: {other_than: 1, message: "can't be blank"}
    validates :city
    validates :address_line1
    validates :number, numericality: { only_integer: true, message: 'is invalid. Input only number'}
    validates :token  
  end

  validates :number, format: { with: /\A\d{10,11}\z/, message: 'is too short' } 
  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Deliverie.create(postal_code: postal_code, source_id: source_id, city: city, address_line1: address_line1, address_line2: address_line2, number: number, order_id: order.id, )
  end
end