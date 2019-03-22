class Customer < ApplicationRecord
  canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/

  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :phone, numericality: true, length: { minimum: 10, maximum: 15 }
  validates :postal_code, format: { with: canadian_postal_code }
  # t.string :first_name
  #     t.string :last_name
  #     t.string :email
  #     t.string :password
  #     t.string :phone
  #     t.string :address
  #     t.string :city
  #     t.string :province
  #     t.string :postal_code
  #     t.string :country
end
