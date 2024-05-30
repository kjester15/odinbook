class FollowsController < ApplicationController
  def index
    p params
    @user = params[:user_id]
    @follows = Follow.where(followee_id: params[:user_id]).or(Follow.where(follower_id: params[:user_id]))
  end

  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.new(follow_params)

    if @follow.save
      redirect_to request.referrer
    else
      redirect_to request.referrer, status: :unprocessable_entity
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to request.referrer
  end

  private

  def follow_params
    params.require(:follow).permit(:follower_id, :followee_id)
  end
end
