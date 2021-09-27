FactoryBot.define do
  factory :item do
    item_name { Faker::Name.initials }
    item_description { '3' }
    category_id { '3' }
    item_condition_id { '3' }
    ship_charge_id { '3' }
    prefecture_id { '3' }
    ship_day_id { '3' }
    price       { '300' }
    association :user
    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image2.png'), filename: 'test_image2.png')
    end
  end
end
