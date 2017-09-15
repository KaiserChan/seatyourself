class ReservationsController < ApplicationController

  def index
    #code
  end

  def new
    # byebug
    @restaurant = Restaurant.find(params[:restaurant_id])
    @reservation = @restaurant.reservations.new

    @user = @current_user
    @reservation.reservation_date = params[:post][:reservation_date]
    @reservation.party_size = params[:party_size]
    @reservation.restaurant_id = params[:restaurant_id]
    @total_slots = @restaurant.find_available_slots(@reservation.reservation_date, @reservation.party_size)
  end

  def create
    @restaurant = Restaurant.find(params[:reservation][:restaurant_id])
    @reservation = @restaurant.reservations.new

    @reservation.reservation_date = params[:reservation][:reservation_date]
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.restaurant_id = params[:reservation][:restaurant_id]
    @reservation.reservation_time = params[:commit]
    @reservation.user_id = params[:user_id]

    @total_slots = @restaurant.find_available_slots(@reservation.reservation_date, @reservation.party_size)

    @reservation.save
    redirect_to root_path

  end

  def show
    @restaurant = Restaurant.find(params[:reservation][:restaurant_id])
    @reservation = @restaurant.reservations.new
    @owner = current_owner


    @reservation.reservation_date = params[:reservation][:reservation_date]
    @reservation.party_size = params[:reservation][:party_size]
    @reservation.restaurant_id = params[:reservation][:restaurant_id]
    @reservation.reservation_time = params[:commit]


  end

end
