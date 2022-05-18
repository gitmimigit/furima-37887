class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @item = Item.find(params[:id])
    @order_delivery = OrderDeliverie.new
  end

  def create
  end
end
