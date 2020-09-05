FactoryBot.define do
  factory :user do
    nickname              {"furima太郎"}
    email                 {"sample@example.com"}
    password              {"abc123"}
    password_confirmation {password}
    family_name           {"山田"}
    first_name            {"陸太郎"}
    family_name_reading   {"ヤマダ"}
    first_name_reading    {"リクタロウ"}
  end
end
