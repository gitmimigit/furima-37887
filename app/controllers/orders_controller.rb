class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  def index
    @order_delivery = OrderDelivery.new
  end

  def create
    @order_delivery =OrderDelivery.new(order_params)
    @order_delivery.price = @item.price
    if @order_delivery.valid?
      pay_item
      @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_delivery).permit(:item_id, :postal_code, :source_id, :city, :address_line1, :address_line2, :number, :price).merge(user_id: current_user.id,token: params[:token])
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: order_params[:price],  
      card: order_params[:token],    
      currency: 'jpy'                 
    )
  end
end
