class RestaurantsController < ApplicationController

  def index
    @restaurants = Restaurant.search(params[:search])
  end

  def show
    #code
  end



end
