class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :owner
end
