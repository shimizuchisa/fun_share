FactoryBot.define do
  factory :genre do
    name { Faker::Lorem.characters(number: 5)}
    is_deleted { Faker::Boolean.boolean(true_ratio: 1)}
  end
end