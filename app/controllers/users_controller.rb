class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :show]
  before_action :correct_user_or_admin_user, only: [:edit, :update]
  before_action :admin_user, only: [:new, :create, :destroy]

  def index
    @users = User.all
  end

  def show
    @user = User.find_by(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Profile for #{@user.username} created"
      redirect_to users_url
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile for #{@user.username} updated"
      redirect_to users_url
    else
      render 'edit'
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User for #{@user.username} deleted"
    redirect_to users_url
  end

  private
    def user_params
      params.require(:user).permit(:username, :password, :password_confirmation)
    end

    def correct_user_or_admin_user
      current_user?(User.find_by(params[:id])) || current_user.has_password?
    end

    def admin_user
      current_user.has_password?
    end
end
