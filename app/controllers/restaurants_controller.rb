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
    @total_available_dates = []

    today = Date.current
    count = 1
    while count <= ALLOWED_DATES
      future_day = today += 1
      @total_available_dates << future_day
      count += 1
    end

    if current_user || current_owner
      render :show
    else
      redirect_to new_sessions_path
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

  def new
    @provinces = ["ON", "BC", "QC"]
    @restaurant = Restaurant.new
    @owner = current_owner
  end

  def create
    @provinces = ["ON", "BC", "QC"]
    @restaurant = Restaurant.new
    @owner = current_owner

    @restaurant.name = params[:restaurant][:name]
    @restaurant.summary = params[:restaurant][:summary]
    @restaurant.street_address = params[:restaurant][:street_address]
    @restaurant.city = params[:restaurant][:city]
    @restaurant.province = params[:restaurant][:province]
    @restaurant.postal_code = params[:restaurant][:postal_code]
    @restaurant.phone = params[:restaurant][:phone]
    @restaurant.email = params[:restaurant][:email]
    @restaurant.max_capacity = params[:restaurant][:max_capacity]
    @restaurant.opening_time = params[:restaurant][:opening_time]
    @restaurant.closing_time = params[:restaurant][:closing_time]
    @restaurant.owner_id = @owner.id


    if @restaurant.save
      redirect_to owners_url
    else
      render :new
    end

  end

  def edit
    @restaurant = Restaurant.find(params[:id])
    @provinces = ["ON", "BC", "QC"]
    @owner = current_owner
  end

end
