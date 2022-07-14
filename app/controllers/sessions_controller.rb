class SessionsController < ApplicationController
  def new
  end

  # the method for sign in users
  def create
    # find the user by entered username
    user = User.find_by(username: params[:session][:username])
    # if user with such name exist and was entered a correct password
    if user && user.authenticate(params[:session][:password])
      puts "logged_in"
      # session id stores the signed in user's id
      session[:user_id] = user.id
      flash[:success] = "Signed in successfully"
      # show user's profile page
      redirect_to root_path
    else
      puts "not_logged_in"
      # authenticate with errors
      flash.now[:error] = "Incorrect username or password"
      render 'new'
    end
  end

  # the method delete a session when a user loged out
  def destroy
    session[:user_id] = nil
    flash[:success] = "You have successfully signed out"
    redirect_to root_path
  end
end
