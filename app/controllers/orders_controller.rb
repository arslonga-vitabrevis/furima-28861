class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
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