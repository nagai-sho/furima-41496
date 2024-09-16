FactoryBot.define do
  factory :order_address do
    post_code     { '123-4567' }
    prefecture_id { 2 }
    municipality  { Faker::Lorem.sentence }
    house_number  { '1-2-3番地' }
    building      { Faker::Lorem.sentence }
    phone_number  { '123-4567-8900' }
    price         { Faker::Number.between(from: 300, to: 1_000_000) }
  end
end
