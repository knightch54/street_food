FactoryBot.define do
  factory :chef do
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    money { 155 }
  end
end
