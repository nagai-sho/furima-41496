class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    if current_user == @item.user_id
      redirect_to root_path
    else
    end
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order = Order.create(order_params)
  end

  def private
    params.require(:order).permit(
      :number
    ).merge(
      user_id: current_user.id,
      item_id: @item_id
    )
  end
end
