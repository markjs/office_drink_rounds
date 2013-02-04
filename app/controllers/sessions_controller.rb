class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: 'You logged in. Grats.'
    else
      flash.now.alert = 'Email or password incorrect'
      render 'new'
    end
  end
end
