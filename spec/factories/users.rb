FactoryBot.define do
  factory :user do
    nickname              { Faker::Internet.username }
    email                 { Faker::Internet.free_email }
    password              { Faker::Internet.password( min_length: 6 ) }
    password_confirmation { password }
    family_name           { Faker::Japanese::Name.last_name }
    first_name            { Faker::Japanese::Name.first_name }
    family_name_reading   { Faker::Japanese::Name.last_name.yomi }
    first_name_reading    { Faker::Japanese::Name.first_name.yomi }
    date_of_birth         { Faker::Date.between( from: "1930-01-01", to: "2015-12-31" ) }
  end
end
