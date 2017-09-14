class Owner < ApplicationRecord
  has_secure_password

  validates :name, :email, :password, presence: true
  validates :email, uniqueness: true



  has_many :restaurants
end
