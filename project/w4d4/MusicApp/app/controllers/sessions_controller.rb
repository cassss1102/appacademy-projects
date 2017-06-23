class SessionsController < ApplicationController
# Write controller methods and the accompanying routes so that users can log in and log out.
# Should session be a singular resource?
# SessionsController#create should re-set the appropriate user's session_token and session[:session_token].
# For now just redirect them to a User#show page which simply displays that user's email.
  def new
    render :new
  end

  #session create is the log in page
  def create
    user = User.find_by_credentials(params[:user][:email], params[:user][:password])
    #if user exists, log in, redirect, else, errors message
    if user
      log_in_user!(user)
      #redirect_to band index page
    else
      flash.now[:errors] = @user.errors.full_message
      render :new
    end
  end

  def destroy #log out
    #log out, session_token reset, cookie
    current_user.reset_session_token
    session[:session_token] = nil
    redirect_to new_session_url
  end


end
