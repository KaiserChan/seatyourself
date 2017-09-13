class Restaurant < ApplicationRecord
  has_many :reservations
  belongs_to :owner


  def self.search(search)
    if search
      find(Restaurant.all, :conditions => ["name LIKE ?", "%#{search}%"])
    else
      find(Restaurant.all)
    end
  end



end
