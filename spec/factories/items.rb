FactoryBot.define do
  factory :item do
    association :user

    image_path = Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/images/cake.jpg'))

    image                { image_path }
    name                 { Faker::Dessert.variety }
    text                 { Faker::Lorem.sentence }
    item_category_id     { Faker::Number.between(from: 1, to: 10) }
    item_condition_id    { Faker::Number.between(from: 1, to: 6) }
    shipping_charge_id   { Faker::Number.between(from: 1, to: 2) }
    shipping_origin_id   { Faker::Number.between(from: 1, to: 47) }
    shipping_period_id   { Faker::Number.between(from: 1, to: 3) }
    price                { Faker::Number.within(range: 300..9999999) }

  end
end
