FactoryBot.define do
  factory :item do
    title { Faker::Coffee.blend_name }
    description { Faker::Coffee.notes }
    item_category_id { Faker::Number.within(range: 2..11) }
    item_condition_id { Faker::Number.within(range: 2..7) }
    delivery_fee_id { Faker::Number.within(range: 2..3) }
    prefecture_id { Faker::Number.within(range: 2..48) }
    delivery_day_id { Faker::Number.within(range: 2..4) }
    price { Faker::Number.within(range: 300..9_999_999) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
