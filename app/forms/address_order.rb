class AddressOrder
  include ActiveModel::Model
  attr_accessor :token,
                :postal_code,
                :prefecture_id,
                :city,
                :house_number,
                :building_name,
                :telephone_number,
                :order_id,
                :item_id,
                :user_id

  with_options presence: true do
    validates :token
    validates :postal_code,      format: { with: /\A\d{3}[-]\d{4}\z/ }
    validates :prefecture_id,    numericality: { other_than: 0 }
    validates :city
    validates :house_number
    validates :telephone_number, format: { with: /\A\d{10,11}\z/ }
    validates :order_id
    validates :item_id
    validates :user_id
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(postal_code: postal_code,
                  prefecture_id: prefecture_id,
                  city: city,
                  house_number: house_number,
                  building_name: building_name,
                  telephone_number: telephone_number,
                  order_id: order.id)
  end
end