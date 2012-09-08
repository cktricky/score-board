class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticated
  helper_method :current_user

  private

  def signed_in?
    return current_user.present? && current_user.activated?
  end

  def authenticated
    if not signed_in?
      reset_session
      flash[:notice] = " You must be logged in to access this page"
      redirect_to root_url
    end
  end

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue Exception => e
    puts e
  end

  def authenticated?
    self.authenticated?
  end
     
  protected

end
