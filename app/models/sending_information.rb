class SendingInformation < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address, :building, :phone_number, :order
  belongs_to :order
  validates :prefecture_id, numericality: {other_than: 1 }
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/ }
    validates :prefecture_id
    validates :city
    validates :address
    validates :phone_number, {with: /\A[0-9]{11}\z/ }
  end
  
  def save
    purchase = Purchase.create(item_id: item_id, user_id: user_id)
    SendingInformation.create(postal_code :postal_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_number: phone_number, order: oreder)
  end
end
