class OrdersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @order = Order.new # (order_params)
    @item = Item.find(params[:item_id])
    @order_sending_information = OrderSendingInformation.new # (order_params)
    # @order_information = OrderInformation.new
  end

  def new
    @order_sending_information = OrderSendingInformation.new
    # @order = Order.new
  end

  # def create
  #   @order = Order.create(order_params)
  #   SendingInformation.create(sending_information_params)
  #   redirect_to root_path
  # end

  # private
  # def order_params
  #   params.permit(:item_id).merge(user_id: current_user.id)
  # end
  # def sending_information_params
  #   params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(order_id: @order_id)
  # end

  def create
    @item = Item.find(params[:item_id])
    @order_sending_information = OrderSendingInformation.new(order_params)
    if @order_sending_information.valid?
      pay_item
      @order_sending_information.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    # params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: @item_id)
    params.require(:order_sending_information).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, # 商品の値段
      card: order_params[:token], # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end
