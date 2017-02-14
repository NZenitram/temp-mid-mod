class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      flash[:success] = "Account for #{user.email} created."
      session[:user_id] = user.id
      redirect_to root_path
    else
      flash[:notice] = "Please fill out all forms and make sure your passwords match."
      redirect_to new_user_path
    end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
