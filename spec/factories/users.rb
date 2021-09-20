FactoryBot.define do
  factory :user do
    name                  { Faker::Name.initials }
    email                 { Faker::Internet.free_email }
    password              { '7z' + Faker::Internet.password }
    password_confirmation { password }
    last_name { '山田' }
    first_name { '太郎' }
    last_name_kana { 'ヤマダ' }
    first_name_kana { 'タロウ' }
    birthday { '2000-01-01' }
  end
end