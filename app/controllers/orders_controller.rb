class OrdersController < ApplicationController
  def index
    @order = AddressOrder.new
    @item = Item.find_by(id:params[:item_id])
  end

  def create
    @item = Item.find_by(id:params[:item_id])
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
end