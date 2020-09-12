class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code
    validates :prefecture_id,    numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :telephone_number
    validates :order_id
  end
end