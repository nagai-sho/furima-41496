class ItemsController < ApplicationController
  def index
    @items = Item.order(created_at: :desc)
  end

  def new
    if user_signed_in?
      @item = Item.new
    else
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.create(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
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
    item.update(:item.user.id)
    if item.save
      redirect_to root_path
    else
      render :edit
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
      :required_number_of_day_id
    ).merge(user_id: current_user.id)
  end
end
