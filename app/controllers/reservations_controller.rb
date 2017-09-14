class ReservationsController < ApplicationController

  def index
    #code
  end

  def new
    # byebug
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new
    #
    # @available_times = @reservation.available_times(params[:post][:reservation_date])
  end

  def create

  end

end
