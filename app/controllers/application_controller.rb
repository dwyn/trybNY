class ApplicationController < ActionController::Base

  before_action :redirect_if_not_logged_in #will not affect the creation of the user, used for creation of account flow 
  helper_method :current_user, :logged_in?

  private 

  def current_user
    @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
   end

  def logged_in?
    !!current_user
  end

  def redirect_if_not_logged_in
    redirect_to root_path unless logged_in?
  end

  def activity
    session[:activity] ||= []
  end

end
