class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #current_user to return the current user. done
#logged_in? to return a boolean indicating whether someone is signed in.done
#log_in_user!(user) reset the users session token and cookie. done
helper_method :current_user, :logged_in?
  def current_user
    return nil unless session[:session_token] #computational purpose, no need to look up database if there is no current user
    @current_user ||= User.find_by_session_token(session[:session])
  end

  def logged_in?
    !current_user.nil?
  end

  def log_in_user!(user)
    user.reset_session_token
    session[:session_token] = nil
  end
  
  def user_params
    params.require(:user).permit(:email, :password)
  end
end
