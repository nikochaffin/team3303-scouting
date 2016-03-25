class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  include SessionsHelper

  private

    def redirect_to_login
      store_location
      flash[:danger] = "Please log in to access this content"
      redirect_to login_url
    end

    # Confirms a logged in user
    def logged_in_user
      unless logged_in?
        redirect_to_login
      end
    end

    def correct_user_or_admin_user
      unless current_user?(User.find_by(params[:id])) || current_user.has_password?
        redirect_to_login
      end
    end

    def admin_user
      unless current_user && current_user.has_password?
        redirect_to_login
      end
    end
end
