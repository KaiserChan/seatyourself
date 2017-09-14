class Reservation < ApplicationRecord
  belongs_to :restaurant

  SLOT_SIZE = 7200
  ALLOWED_DATES = 14

  # def available_times(date)
  #   #code
  #   total_slots = []
  #   # total_available_dates = []
  #
  #
  #   # today = Date.current
  #   # count = 1
  #   # while count <= ALLOWED_DATES
  #   #   future_day = today += 1
  #   #   total_available_dates << future_day.strftime("%A %dth %B")
  #   #   count += 1
  #   # end
  #
  #
  #   num_of_slots = ( ((restaurant.closing_time - restaurant.opening_time)-1) / SLOT_SIZE )
  #
  #
  #   num_of_slots.to_i.times do
  #     slot = restaurant.opening_time += SLOT_SIZE
  #     total_slots << slot
  #   end
  #
  #   # hash = Hash.new
  #   #
  #   # total_available_dates.each do |date|
  #   #   hash[date] = total_slots
  #   # end
  #   #
  #   # hash
  #   total_slots
  # end

end
