class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, :email, :password, :phone, :city, presence: true
  validates :email, uniqueness: true
  validates :phone, numericality: true


  has_many :reservations
end
