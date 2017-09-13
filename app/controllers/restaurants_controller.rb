class RestaurantsController < ApplicationController

  SLOT_SIZE = 7200
  ALLOWED_DATES = 14

  def index
    # @restaurants = Restaurant.search(params[:search])

    @restaurants = Restaurant.all
    if params[:search]
      @restaurants = Restaurant.search(params[:search])
    else
      @restaurants = Restaurant.all
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
    @reservations = @restaurant.reservations
    @reservation = @restaurant.reservations.new
    @total_slots = []
    @total_available_dates = []


    today = Date.current
    count = 1
    while count <= ALLOWED_DATES
      future_day = today += 1
      @total_available_dates << future_day.strftime("%A %dth %B")
      count += 1
    end


    # num_of_slots = ( ((@restaurant.closing_time - @restaurant.opening_time)-1) / SLOT_SIZE )
    #
    #
    # num_of_slots.to_i.times do
    #   slot = @restaurant.opening_time += SLOT_SIZE
    #   @total_slots << slot
    # end
    #
    # @hash = Hash.new
    # @total_available_dates.each do |date|
    #   @hash[date] = @total_slots
    # end
  end



end
