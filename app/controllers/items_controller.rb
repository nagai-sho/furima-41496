class ItemsController < ApplicationController
  def index
  end

  def new
    @items = Item.new
  end

  def create
    @item = item.create(params[:id])
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :product,
      :explain,
      :price,
      :category_id,
      :condition_id,
      :shipping_fee_id,
      :prefecture_id,
      :require_number_of_day_id
    ).merge(user_id: current_user.id)
  end
end
