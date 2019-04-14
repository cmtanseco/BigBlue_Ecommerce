class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  ##canadian_postal_code = /\A[ABCEGHJKLMNPRSTVXY]{1}\\d{1}[A-Z]{1}[ -]?\\d{1}[A-Z]{1}\\d{1}\z/
  belongs_to :province
  validates :first_name, :last_name, :email, :province_id, presence: true
  validates :email, uniqueness: true
  validates :phone, numericality: true, length: { minimum: 10, maximum: 15 }
  ##validates :postal_code, format: { with: canadian_postal_code }
end
