class FollowsController < ApplicationController
  def index
    @follows = Follow.where(followee_id: current_user).or(Follow.where(follower_id: current_user))
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
