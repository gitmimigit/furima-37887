class OrdersController < ApplicationController
  before_action :authenticate_user!, only: :index
  def index
    @order_delivery = OrderDeliverie.new
  end

  def create
  end
end
