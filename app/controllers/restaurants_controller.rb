class RestaurantsController < ApplicationController

  SLOT_SIZE = 3600


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
    @total_slots = []
    @num_of_slots = ( (@restaurant.closing_time - @restaurant.opening_time) / SLOT_SIZE )

    @num_of_slots.to_i.times do
      slot = @restaurant.opening_time += SLOT_SIZE
      @total_slots << slot
    end
  end



end
