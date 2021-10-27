FactoryBot.define do
  # password = Faker::Internet.password(min_length:6)
  factory :user do
    email { Faker::Internet.email }
    password { Faker::Internet.password(min_length: 6) }
    # password { "abc123"}
    password_confirmation { password }
    nickname              { 'test' }
    last_name           { '山田' }
    last_name_kana      { 'ヤマダ' }
    first_name            { '太郎' }
    first_name_kana       { 'タロウ' }
    birth_date { '2000-01-01' }
  end
end
# FactoryBot.define do
#   password = Faker::Internet.password(min_length:6)

#   factory :user do
#     nickname              { "yamada" }
#     email                 { Faker::Internet.email }
#     password              { password }
#     password_confirmation { password }
#     first_name            { "ぜんかく" }
#     last_name             { "ぜんかく" }
#     first_kana            { "ゼンカクカナ" }
#     last_kana             { "ゼンカクカナ" }
#     birthday              { "2020-01-01" }
#   end
# end
