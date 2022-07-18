class UsersController < ApplicationController

  def new
    @user = User.new
  end

  # method for creating new users
  def create
    # creating new user with params(username, password)
    @user = User.new(user_params)

    # when the new user was created parameters created_at, updated_at sets automatically (see users table in schema.db)
    if @user.save
      # sign in user when he signed up
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.username}. You have successfully signed up!"
      # redirect to the articles page
      redirect_to root_path
    else
      # redirecting to the new page if the user wasn't created
      render 'new'
    end
  end

  private

  def user_params
    params.require(:user).permit(:username, :password)
  end

end
