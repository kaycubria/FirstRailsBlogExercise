class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    if user.save
      session[:user_id] = user.id
      redirect_to @user
    else
      redirect_to '/users/new'
    end
  end

  def show
    @user = User.find_by_id(session[:user_id])
    @posts = @user.posts
  end

private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
