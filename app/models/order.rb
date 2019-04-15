class Order < ApplicationRecord
  belongs_to :customer
  has_many :product_orders
  has_many :products, through: :product_orders

validates :order_date, presence: true
end
