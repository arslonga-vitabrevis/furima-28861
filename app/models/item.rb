class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image

  with_options presence: true do
    validates :name,                length: { maximum:40 }
    validates :text,                length: { maximum:1000 }
    validates :item_category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :shipping_origin_id
    validates :shipping_period_id
    validates :price,               numericality: { greater_than_or_equal_to:300, less_than_or_equal_to: 9999999 }
    validates :user
  end

  with_options numericality: { other_than: 1 } do
    validates :item_category_id
    validates :item_condition_id
    validates :shipping_charge_id
    validates :shipping_origin_id
    validates :shipping_period_id
  end
end
