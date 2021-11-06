class Order < ApplicationRecord
  belongs_to :Item
  has_one :sending_information
  belongs_to :user
end
