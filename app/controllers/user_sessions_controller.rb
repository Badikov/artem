class UserSessionsController < ApplicationController

  skip_before_filter :verify_authenticity_token,
                      :if => Proc.new { |c| c.request.format == 'application/json' }
  before_filter :require_user, :only => [:destroy]
  respond_to :json

  
  def create
    session = params[:user_session]
    if (session[:login].blank? || session[:password].blank? || session[:phone_number].blank? || session[:imei].blank?)
      render :json => {:success => false,:info => "Login Failed"}, :status => 400 and return 
    end

    user = User.find_by_login_and_phone_number session[:login],session[:phone_number]
    unless user.blank? && user.login_count > 0
      user.update(imei: session[:imei])
    end

    if user.imei == session[:imei]
      user_session = UserSession.new user_session_params
    else
      render :json => {:success => false,:info => "Login Failed",:data => {}}, :status => 401 and return
    end

    # if (params[:user_session][:login].blank? || params[:user_session][:password].blank?) && params[:remember_token].blank? 
    #   render :json => {:success => false}, :status => 400 and return 
    # end

    # the user is still authenticated in the ember app 
    # if params[:remember_token].present? 
    #   user = User.find_by_single_access_token(params[:remember_token]) 
    #   user_session = UserSession.create(user) unless user.blank? 
    # else 
    #   user_session = UserSession.new user_session_params #(:login => params[:user_session][:login], :password => params[:user_session][:password]) 
    # end

    #Rails.logger.info(user_session.inspect)
    if user_session && user_session.save
      
      current_user.reset_single_access_token! unless params[:remember_token].present?
      data = {
        :auth_token => current_user.single_access_token,
        :user_id    => current_user.id
      }
      # if params[:user_session][:remember_me]
      #   data[:remember_token] = current_user.single_access_token
      # end

      # I'm only using user_session to authenticate them the first time 
      # we don't want Authlogic persisting the user session 
      user_session.destroy

      # return 'auth_token', 'user_id', and 'remember_token' (if they checked "remember me") 
      render :json => {:success => true, :info => "Logged in",:data => data}, :status => 201
    else
      render :json => {:success => false,:info => "Login Failed",:data => {}}, :status => 401
    end
  end

  def destroy
    if current_user 
      current_user.reset_single_access_token! 
      render :json => {:success => true,
                       :info => "Logged out",
                       :data => {}}, :status => 200 
    else 
      render :json => {:success => false}, :status => 400 
    end 
  end

  private

  def user_session_params
    params.require(:user_session).permit(:login, :password)
  end
end
