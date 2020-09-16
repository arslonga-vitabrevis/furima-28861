FactoryBot.define do
  factory :address_order do
    association :user
    association :item

    postal_code       { "630-8501"}
    prefecture_id     { 29 }
    city              { "奈良市" }
    house_number      { "登大路町30" }
    building_name     { "奈良荘" }
    telephone_number  { "0742221101" }
  end
end
