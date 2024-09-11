FactoryBot.define do
  factory :user do
    nickname              { Faker::Name.initials(number: 2) }
    email                 { Faker::Internet.email }
    password              { '1a' + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    last_name             { 'やマ田' }
    last_name_kana        { 'ヤマダ' }
    first_name            { '太ろウ' }
    first_name_kana       { 'タロウ' }
    birthday              { Faker::Date.between(from: '1930-01-01', to: '2017-12-31') }
  end
end
