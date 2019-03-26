class Product < ApplicationRecord
  belongs_to :designer
  belongs_to :category
  has_many :product_orders
  has_many :orders, through: :product_orders

  validates :name, :price, :stock, :size, :description, presence: true
  validates :stock, numericality: { only_integer: true }
  validates :name, uniqueness: true

  paginates_per 2

  mount_uploader :image, ImageUploader
end
