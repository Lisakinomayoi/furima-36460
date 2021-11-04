class Item < ApplicationRecord
  belongs_to :user, optional: true
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :prefecture
  belongs_to :sales_status
  belongs_to :scheduled_delivery
  belongs_to :shipping_fee_status
  # with_options presence: true do
  #   validates :name
  #   validates :price, numericality: true, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  #   validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  #   validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  #   validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  #   validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}
  #   validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  #   validates :info
  #   validates :image
  # end  
  validates :name, :info, :category_id, :prefecture_id, :sales_status_id, :shipping_fee_status_id, :price, :user_id, presence: true

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :sales_status_id, numericality: { other_than: 1 , message: "can't be blank"}
  validates :scheduled_delivery_id, numericality: { other_than: 1 , message: "can't be blank"}    
  validates :shipping_fee_status_id, numericality: { other_than: 1 , message: "can't be blank"} 
  validates :price, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :price, numericality: true
end
