class Product < ApplicationRecord
  belongs_to :designer
  belongs_to :category

  validates :name, :price, :stock, :size, :description, presence: true
  validates :stock, :price, numericality: { only_integer: true }
  validates :name, uniqueness: true
end
