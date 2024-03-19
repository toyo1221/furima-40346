class Order < ApplicationRecord
  belongs_to :item
  has_one :order_detail
  belongs_to :user
end
