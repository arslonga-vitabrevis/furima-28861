FactoryBot.define do
  factory :item do
    image                { Rails.root.join('public/images/cake.jpg') }
    name                 { Faker::Dessert.variety }
    text                 { Faker::Lorem.sentence }
    item_category_id     { Faker::Number.between(from: 1, to:10) }
    item_condition_id    { Faker::Number.between(from: 1, to:6) }
    shipping_charge_id   { Faker::Number.between(from: 1, to:2) }
    shipping_origin_id   { Faker::Number.between(from: 1, to:47) }
    shipping_period_id   { Faker::Number.between(from: 1, to:3) }
    price                { Faker::Number.within(range: 300..9999999) }

    # association :item_category
    # association :item_condition
    # association :shipping_charge
    # association :prefecture
    # association :shipping_period
    association :user
  end
end
