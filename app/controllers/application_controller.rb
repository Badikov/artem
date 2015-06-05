require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  helper_method :current_user_session, :current_user

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  
  protect_from_forgery with: :exception
  #protect_from_forgery with: :null_session, only: Proc.new { |c| c.request.format.json? }

  private  
  
  def current_user_session
    @current_user_session ||= UserSession.find
  end

  def current_user
    @current_user ||= current_user_session && current_user_session.user
  end

  def require_admin
      unless current_user
      
        store_location
        flash[:notice] = "You must be logged in to access this page"
        #==>new_admin_admin_url
        redirect_to new_admin_admin_url
        return false
      end
    end

  def require_user 
    unless current_user 
      render(:json => {:success => false,:info => 'Authentication required.',:data => {}}, :status => 401) and return false 
    end 
  end

  def store_location
      session[:return_to] = request.url
  end
end
