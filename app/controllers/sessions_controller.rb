class SessionsController < ApplicationController

  def new
    redirect_to root_url if current_user
  end

  def create
    # If a username has been supplied, assume that it's an admin user
    user = User.find_by(username: params[:session][:username])
    if user && !user.admin? && params[:session][:password] == ""
      log_in user
      redirect_back_or root_url
    elsif user && user.authenticate(params[:session][:password])
      log_in user
      redirect_back_or root_url
    else
      # Render an error message
      flash.now[:danger] = 'Invalid username/password combination'
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to root_url
  end
end
