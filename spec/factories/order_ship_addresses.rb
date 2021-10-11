FactoryBot.define do
  factory :order_ship_address do
    postcode { '678-1234' }
    prefecture_id { '3' }
    city { '新宿区' }
    block { '青山37-5' }
    telephone_number { '09098765432' }
    token { 'tok_abcdefghijk00000000000000000' }
    association :user, :item
  end
end
