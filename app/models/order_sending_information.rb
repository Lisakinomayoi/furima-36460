class OrderSendingInformation
  include ActiveModel::Model
  attr_accessor :token, :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :user_id, :item_id

  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank" }
  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :address
    validates :phone_number, format: { with: /\A\d{10,11}\z/, message: 'is invalid.' }
    validates :item_id
    validates :user_id
    validates :token
  end

  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    SendingInformation.create(postal_code: postal_code, prefecture_id: prefecture_id, city: city, address: address,
                              building: building, phone_number: phone_number, order_id: order.id)
  end
end
