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
end