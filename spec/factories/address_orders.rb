FactoryBot.define do
  factory :address_order do

    # token = Payjp::Token.new(
    #     {
    #     :card => {
    #       :number => '4242424242424242',
    #       :cvc => '123',
    #       :exp_month => '2',
    #       :exp_year => '2024'
    #       }
    #     },
    #     {
    #       'X-Payjp-Direct-Token-Generate': 'true'
    #     } 
    #   )

    tok_num = Faker::Lorem.characters(number: 28)

    token             { "tok_#{tok_num}" }
    postal_code       { "630-8501"}
    prefecture_id     { 29 }
    city              { "奈良市" }
    house_number      { "登大路町30" }
    building_name     { "奈良荘" }
    telephone_number  { "0742221101" }
    item_id           { 3 }
    user_id           { 2 }

  end
end
