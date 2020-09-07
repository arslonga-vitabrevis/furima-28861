class ItemsController < ApplicationController
  def index
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
      :price).merge(
        user:current_user.id
      )
  end
end
