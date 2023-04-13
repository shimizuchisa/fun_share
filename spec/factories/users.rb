FactoryBot.define do
  factory :user do
    last_name { Faker::Lorem.characters(number:5) }
    first_name { Faker::Lorem.characters(number:5) }
    email { Faker::Internet.email }
    telephone_number { Faker::Number.between(from: 1000000000, to: 9999999999) }
    password { Faker::Lorem.characters(number:8) }
    is_deleted { Faker::Boolean.boolean(true_ratio: 1) }
  end
end