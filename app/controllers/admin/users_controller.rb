class Admin::UsersController < ApplicationController
  before_filter :require_user
  before_filter :require_admin, except: [:index]
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def edit
  end

  def create
    @user = User.new user_params
    if @user.save
      redirect_to users_path, notice: "User successfully created"
    else
      render "new"
    end
  end

  def update
    @user.update user_params
    redirect_to users_path, notice: "User successfully updated"
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "User successfully deleted"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :phone_number, :active, :login, :password, :password_confirmation)
  end
end
