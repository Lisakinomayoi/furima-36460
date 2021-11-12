class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @order = Order.new 
    @item = Item.find(params[:item_id])
    if @item.order.presence
      redirect_to root_path
    end  
    if current_user.id == @item.user_id
      redirect_to root_path
    end
    @order_sending_information = OrderSendingInformation.new 
  end

  def new
    @order_sending_information = OrderSendingInformation.new
  end


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
    params.require(:order_sending_information).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price, 
      card: order_params[:token], 
      currency: 'jpy'                 
    )
  end
end
