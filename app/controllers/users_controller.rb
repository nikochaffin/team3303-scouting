class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  before_action :correct_user_or_admin_user, only: [:edit, :update]
  before_action :admin_user, only: [:new, :create, :destroy]

  def index
    @users = User.all
  end

  def create
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end
end
