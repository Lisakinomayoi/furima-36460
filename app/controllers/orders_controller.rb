class OrdersController < ApplicationController
  def index
    #@order = Order.new#(order_params)
    @item = Item.find(params[:item_id])
    @order_address = OrderAddress.new#(order_params)
    #@order_information = OrderInformation.new
  end

  def new
    #@order = Order.new
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
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private 
  def order_params
    params.permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user, item_id: @item.id)
    #params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(user_id: current_user, item_id: @item.id)
  end
end
