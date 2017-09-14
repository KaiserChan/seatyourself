class Restaurant < ApplicationRecord

  SLOT_SIZE = 7200

  has_many :reservations
  belongs_to :owner


  def self.search(search)
    if search
      find(Restaurant.all, :conditions => ["name LIKE ?", "%#{search}%"])
    else
      find(Restaurant.all)
    end
  end

  def find_available_slots(date)
    reservation_dates = reservations.pluck(:reservation_date)
    reservation_times = reservations.pluck(:reservation_time)
    if reservation_dates.include?(date)
      slots = time_slots
      reservation_times.each do |time|
        slots.delete_if do |slot|
          slot == time.strftime("%I%p")
        end
      end
      slots
    else
      time_slots
    end
  end

  def time_slots

    result = []

    current_time = opening_time
    while current_time < closing_time
      result << current_time.strftime("%I%p")
      current_time += SLOT_SIZE
    end

    # num_of_slots = ( ((closing_time - opening_time)-1) / SLOT_SIZE )
    # puts "In time slots method"

    # num_of_slots.to_i.times do
    #   puts "slot = #{opening_time} += #{SLOT_SIZE}"
    #   slot = opening_time += SLOT_SIZE
    #   result << slot
    # end

    result
  end

end
