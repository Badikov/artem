class UserSessionsController < ApplicationController
  skip_before_filter :verify_authenticity_token,
                     :if => Proc.new { |c| c.request.format == 'application/json' }
  respond_to :json

  
  def create
    if (params[:user_session][:login].blank? || params[:user_session][:password].blank?) && params[:remember_token].blank? 
      render :json => {}, :status => 400 and return 
    end

    # the user is still authenticated in the ember app 
    if params[:remember_token].present? 
      user = User.find_by_single_access_token(params[:remember_token]) 
      user_session = UserSession.create(user) unless user.blank? 
    else 
      user_session = UserSession.new user_session_params #(:login => params[:user_session][:login], :password => params[:user_session][:password]) 
    end
    #Rails.logger.info(user_session.inspect)
    if user_session.save
      
      current_user.reset_single_access_token! unless params[:remember_token].present?
      data = {
        :auth_token => current_user.single_access_token,
        :user_id    => current_user.id
      }
      if params[:user_session][:remember_me]
        data[:remember_token] = current_user.single_access_token
      end

      # I'm only using user_session to authenticate them the first time 
      # we don't want Authlogic persisting the user session 
      user_session.destroy

      # return 'auth_token', 'user_id', and 'remember_token' (if they checked "remember me") 
      render :json => {:success => true, :info => "Logged in",:data => data}, :status => 201
    else
      render :json => {:success => false,:info => "Login Failed",:data => {}}, :status => 401
    end
=begin

    # 1. get user by login and phone
    @user = User.find_by_login_and_phone_number params[:user_session][:login], params[:user_session][:phone_number]
    Rails.logger.info(@user.inspect)

    @user_session = UserSession.new user_session_params
    if @user_session.save
      Rails.logger.info(current_user.inspect)

      logger.debug{ "===============>" }
      Rails.logger.info(session.inspect)
        render :status => 200,:json => { :success => true, :info => "Logged in",
                      :data => {  } }
      else
        render :status => 401,
           :json => { :success => false,
                      :info => "Login Failed",
                      :data => {} }
    
    end
=end
  end

  def destroy
    if current_user 
      current_user.reset_single_access_token! 
      render :json => {:success => true,
                       :info => "Logged out",
                       :user_id => current_user.id}, :status => 200 
    else 
      render :json => {}, :status => 400 
    end 
  end

  private

  def user_session_params
    params.require(:user_session).permit(:login, :password)
  end
end
