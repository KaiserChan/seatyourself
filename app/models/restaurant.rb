class Restaurant < ApplicationRecord

  SLOT_SIZE = 2

  has_many :reservations
  belongs_to :owner


  def self.search(search)
    if search
      find(Restaurant.all, :conditions => ["name LIKE ?", "%#{search}%"])
    else
      find(Restaurant.all)
    end
  end


  def find_available_slots(date, party)

    reservations = self.reservations.all
    reservation = reservations.where(reservation_date: date)
    reservation_times = reservation.pluck(:reservation_time)


    if reservation

      slots = time_slots
      reservation_times.each do |time|

        slots.delete_if do |slot|
          check_party_size_for_time_slot(slot, party)
        end

      end

      slots
    else
      time_slots
    end

  end

  def check_party_size_for_time_slot(slot, party)
    # find all reservations at this time_slot for specific restaurant
    reservation = self.reservations.where(reservation_time: slot)
    # add up their party sizes
    all_party_sizes = reservation.pluck(:party_size).sum
    # add the new party sizes
    all_party_sizes += party
    # compare to capacity
    all_party_sizes > max_capacity
  end

  def find_remaining_seats(slot, date)

    reservation = self.reservations.where(reservation_time: slot).where(reservation_date: date)

    all_taken_seats = reservation.pluck(:party_size).sum
    max_capacity - all_taken_seats
  end

  def time_slots

    result = []
    current_time = opening_time

    while current_time < closing_time
      result << current_time
      current_time = current_time
      current_time += SLOT_SIZE
    end

    result
  end

  def convert(h)
    p, l = h.divmod(12)
    "#{l.zero? ? 12 : l} #{p.zero? ? "a" : "p"}m"
  end

end
