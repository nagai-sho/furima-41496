class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    @item = Item.find(params[:item_id])
    return if current_user == @item.user_id

    redirect_to root_path
  end
end
