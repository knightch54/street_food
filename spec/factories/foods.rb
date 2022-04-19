FactoryBot.define do
  factory :food do
    name { Faker::Food.unique.dish }
    description { Faker::Food.unique.description }
    price { 11.50 }
    amount { 10 }
  end
end
