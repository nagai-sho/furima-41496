class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user_id
      redirect_to root_path
    else
    end
    @order = Order.new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index, status: :enprocessable_entity
    end
    # @order = Order.create(order_params)
    # Address.create(address_params)
  end

  private

  def order_params
    params.require(:order_adress)
          .permit(
            :price,
            :post_code,
            :prefecture_id,
            :municipality,
            :house_number,
            :building,
            :phone_number
          ).merge(user_id: current_user.id)
  end
end
