class UsersController < ApplicationController

  def new
    @user = User.new
    @provinces = ["ON", "BC", "QC"]
  end

  def create
    @user = User.new
    @provinces = ["ON", "BC", "QC"]

    @user.first_name = params[:user][:first_name]
    @user.last_name = params[:user][:last_name]
    @user.email = params[:user][:email]
    @user.password = params[:user][:password]
    @user.password_confirmation = params[:user][:password_confirmation]
    @user.phone = params[:user][:phone]
    @user.city = params[:user][:city]
    @user.province = params[:province][:province]

    if @user.save
      redirect_to root_path
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
