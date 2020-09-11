class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit]

  def index
    @items = Item.includes(:user).order("created_at DESC")
    @orders = Order.includes(:item, :user)
  end

  def new
    @item = Item.new
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render new_item_path
    end
  end

  def show
    @orders = Order.includes(:item, :user)
    @pref_id = @item.shipping_origin_id
    @prefecture = Prefecture.find(@pref_id)
  end

  def edit
  end

  def update
    @item = Item.find(params[:id])
      if @item.update(item_params)
        redirect_to item_path
      else
        render edit_item_path
      end
  end

  private

  def item_params
    params.require(:item).permit(
      :image,
      :name,
      :text,
      :item_category_id,
      :item_condition_id,
      :shipping_charge_id,
      :shipping_origin_id,
      :shipping_period_id,
      :price).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
