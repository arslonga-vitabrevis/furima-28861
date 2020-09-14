class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item, only: [:index, :create]

  def index
    @orders = Order.includes(:item, :user)
    if @item.user_id == current_user.id
      redirect_to root_path
    end
    if @orders.exists?(item_id: @item.id)
      redirect_to root_path
    end
    @order = AddressOrder.new
  end

  def create
    @order = AddressOrder.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.permit(
      :postal_code,
      :prefecture_id,
      :city,
      :house_number,
      :telephone_number,
      :building_name,
      :order_id,
      :item_id).merge(user_id: current_user.id)
  end
  def set_item
    @item = Item.find_by(id:params[:item_id])
  end
end