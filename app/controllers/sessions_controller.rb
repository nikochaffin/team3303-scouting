class SessionsController < ApplicationController

  def new
    redirect_to root_url if current_user
  end

  def create
    # If a username has been supplied, assume that it's an admin user
    if params[:session][:username]
      user = User.find_by(username: params[:session][:username])
      if user && user.authenticate(params[:session][:password])
        log_in user
        redirect_to root_url
      else
        # Render an error message
        flash.now[:danger] = 'Invalid email/password combination'
        render 'new'
      end
    # Otherwise, assume it's a regular user
    else
      # Check against the `team_password` keyword in Settings
      render 'new'
    end
  end


  def destroy
    log_out
    redirect_to root_url
  end
end
