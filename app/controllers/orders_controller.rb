class OrdersController < ApplicationController
  def index
    @order = Order.new#(order_params)
    @item = Item.find(params[:item_id])
    #@order_information = OrderInformation.new
  end

  def new
    
  end

  def create
    @order_information = OrderInformation.new(order_params)

  end

  private 
  def order_params
    params.require(:order_information).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user, item_id: @item_id)
  end
end
