class OwnersController < ApplicationController

  def new
    @owner = Owner.new
  end

  def create
    @owner = Owner.new

    @owner.name = params[:owner][:name]
    @owner.email = params[:owner][:email]
    @owner.password = params[:owner][:password]
    @owner.password_confirmation = params[:owner][:password_confirmation]

    if @owner.save
      render :show
    else
      render :new
    end
  end

  def edit
    #code
  end

  def show
    # @user = User.find(params[:id])
  end

  def update
    #code
  end


end
