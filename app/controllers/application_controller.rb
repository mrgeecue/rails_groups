class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  def current_user
    @logged_in = User.find(session[:user_id]) if session[:user_id]
  end

  def require_login
    redirect_to '/' if session[:user_id] == nil
    flash[:error] = "Login First!" if session[:user_id] == nil
  end


  helper_method :current_user
end
