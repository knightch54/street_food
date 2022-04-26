FactoryBot.define do
  factory :order do
    user_id { 1 }
    chef_id { 0 }
    status { 0 }
    price { 15.50 }
  end
end
