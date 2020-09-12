class AddressOrder
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :house_number, :building_name, :telephone_number, :order_id, :item, :user

  with_options presence: true do
    validates :postal_code,      format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id,    numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{11}\z/ }
    validates :order_id
    validates :item
    validates :user
  end
end