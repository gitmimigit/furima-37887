class ItemsController < ApplicationController
  before_action :authenticate_user!, only: :new

  def index
    @item =Item.includes(:user).order("created_at DESC")
  end 

  def new
    @item =Item.new
  end

  def create
    @item =Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    item.update(item_params) 
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :describe, :category_id, :status_id, :fee_id, :source_id, :duration_id, :price).merge(user_id: current_user.id)
  end
end
