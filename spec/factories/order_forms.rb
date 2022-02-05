FactoryBot.define do
  factory :order_form do
    postcode { Faker::Number.decimal_part(digits: 3) + '-' + Faker::Number.decimal_part(digits: 4) }
    prefecture_id { Faker::Number.between(from: 2, to: 48) }
    city { Faker::Address.city }
    street { Faker::Address.street_address }
    building { Faker::Address.street_address }
    phone { Faker::Number.decimal_part(digits: 11) }
    token { Faker::Internet.password(min_length: 3, max_length: 4) }
  end
end