class Admin::AdminsController < ApplicationController

  def index
    if current_user
      redirect_to users_path
    else
      redirect_to new_admin_admin_path
    end
    #logger.debug{"из модели " + current_user.user}
  end

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new user_session_params
    #TODO здесь логинится должен мочь только первый User
    if @user_session.save
      #logger.debug{"из модели " + @user_session.authenticity_token}
      Rails.logger.info(@user_session.inspect)
      redirect_to admin_admins_path
    else
      redirect_to new_admin_admin_path
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to root_path #new_admin_admin_path
  end

  private

  def user_session_params
    params.require(:user_session).permit(:login, :password, :remember_me)
  end
end
