FactoryBot.define do
  factory :item do
    item_name { Faker::Name.initials }
    image { Faker::Lorem.sentence }
    item_description { '111' }
    category_id { '111' }
    item_condition_id { '111' }
    ship_charge_id { '111' }
    prefecture_id { '111' }
    ship_day_id { '111' }
    price { '300' }
    association :user
  end
end
