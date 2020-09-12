class Address < ApplicationRecord
  belongs_to :order

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  with_options presence: true do
    validates :postal_code,      format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id,    numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{11}\z/ }
    validates :order_id
  end
end