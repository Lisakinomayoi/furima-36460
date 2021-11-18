class Order < ApplicationRecord
  belongs_to :item
  has_one :sending_information
  belongs_to :user
end
