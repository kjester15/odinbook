class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    if params[:id]
      @user = User.find(params[:id])
    else
      @user = current_user
    end
    @posts = @user.posts.all
  end
end
