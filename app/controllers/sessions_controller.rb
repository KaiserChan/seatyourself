class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to(root_url, notice: "Logged in!")
      return
    end

    owner = Owner.find_by(email: params[:email])
    if owner && owner.authenticate(params[:password])
      session[:owner_id] = owner.id
      redirect_to(root_url, notice: "Logged in!")
      return
    end
  end

  def destroy
    session[:user_id] = nil || session[:owner_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

end
