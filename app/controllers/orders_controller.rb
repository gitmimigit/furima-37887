class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  before_action :set_item, only: [:index, :create]
  def index
    @order_delivery = OrderDeliverie.new
  end

  def create
    @order_delivery =OrderDelivery.new(order_params)
    if @order_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_delivery).permit(:item_id, :postal_code, :source_id, :city, :address_line1, :address_line2, :number).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
