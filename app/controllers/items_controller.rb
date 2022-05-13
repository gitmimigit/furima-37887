class ItemsController < ApplicationController
  def index
  end

  def new
    @item =Item.new
  end

  def create
    Item.new(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :item_name, :describe, :category_id, :status_id, :fee_id, :source_id, :duration_id, :price).merge(user_id: current_user.id)
  end
end
