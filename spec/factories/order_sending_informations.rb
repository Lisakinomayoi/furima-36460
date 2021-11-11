FactoryBot.define do
  factory :order_sending_information do
    postal_code {'123-4567'}
    prefecture_id {2}
    city {'明石市'}
    address {'1-1'}
    building {'ハイツ'}
    phone_number {'1234567890'}
    #item_id {1}
    #user_id {1}
  end
end
