class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.includes(:order).order(created_at: :desc)
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
  end

  def edit
    if @item.order.present?
      redirect_to root_path
    elsif current_user.id != @item.user_id
      redirect_to new_user_session_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    else
      render :show, status: :unprocessable_entit
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

  def set_item
    @item = Item.includes(:order).find(params[:id])
  end
end
