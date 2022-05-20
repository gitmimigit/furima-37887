class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy ]
  before_action :set_item, only: [:show, :edit, :update, :destroy ]

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
  end

  def edit
    if current_user.id != @item.user_id || @item.order.present?
      redirect_to action: :index
    end
  end

  def update
    if @item.update(item_params) 
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    if current_user.id == @item.user_id
    @item.destroy
    end
    redirect_to root_path
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :describe, :category_id, :status_id, :fee_id, :source_id, :duration_id, :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

end
