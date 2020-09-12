class OrdersController < ApplicationController
  def index
    @order = AddressOrder.new
    @item = Item.find_by(id:params[:item_id])
  end

  def create
  end
end
