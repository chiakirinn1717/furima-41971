FactoryBot.define do
  factory :address_history do
    zipcode { '123-4567' }
    prefecture_id { Faker::Number.within(range: 2..48) }
    city { '東京都' }
    street { '1-1' }
    building { '東京ハイツ' }
    phone_number { '1234567890' }
    association :user
    association :item
    token {"some_generated_token_value"}
  end
end
