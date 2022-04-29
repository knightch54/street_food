FactoryBot.define do
  factory :user do
    # orders
    name { Faker::Name.unique.name }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.unique.password }

    # trait :orders do
    #   after(:create) do |user|
    #     create(:order, user_id: user.id, status: 1, updated_at: Faker::Time.between(from: DateTime.now - 1, to: DateTime.now))
    #   end
    # end
  end
end
