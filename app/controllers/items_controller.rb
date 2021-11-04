class ItemsController < ApplicationController
  #before_action :move_to_index, except: [:index, :show, :new, :create, :edit, :destroy, :update]
  before_action :authenticate_user!, only: :new

  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    #@item.images.new
  end

  def create
    @item = Item.new(item_params)   
    #@item.user_id = current_user.id
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new 
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end