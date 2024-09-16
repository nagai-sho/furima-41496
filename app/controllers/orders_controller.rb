class OrdersController < ApplicationController
  before_action :authenticate_user!
  def index
    gon.public_key = ENV['PAYJP_PUBLIC_KEY']
    @order_address = OrderAddress.new
    @item = Item.find(params[:item_id])
    if current_user.id == @item.user_id
      redirect_to root_path
    else
    end
    @order = Order.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item(@order_address.token)
      @order_address.save
      redirect_to root_path
    else
      gon.public_key = ENV['PAYJP_PUBLIC_KEY']
      render :index, status: :unprocessable_entity
    end
  end

  private

  def pay_item(token)
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # 　カードトークン
      currency: 'jpy' # 通貨の種類
    )
  end

  def order_params
    params.require(:order_address)
          .permit(
            :post_code,
            :prefecture_id,
            :municipality,
            :house_number,
            :building,
            :phone_number
          ).merge(
            user_id: current_user.id,
            item_id: params[:item_id],
            token: params[:token]
          )
  end
end
