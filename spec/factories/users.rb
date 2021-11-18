FactoryBot.define do
  # password = Faker::Internet.password(min_length:6)
  factory :user do
    email { Faker::Internet.email }
    password { "1a" + Faker::Internet.password(min_length: 6) }
    password_confirmation { password }
    nickname              { 'test' }
    last_name           { '山田' }
    last_name_kana      { 'ヤマダ' }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    birth_date { '2000-01-01' }
  end
end