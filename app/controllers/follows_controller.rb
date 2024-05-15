class FollowsController < ApplicationController
  def new
    @follow = Follow.new
  end

  def create
    @follow = Follow.new(follow_params)

    if @follow.save
      redirect_to users_path
    else
      redirect_to users_path, status: :unprocessable_entity
    end
  end

  def destroy
    @follow = Follow.find(params[:id])
    @follow.destroy
    redirect_to users_path
  end

  private

  def follow_params
    params.require(:follow).permit(:follower_id, :followee_id)
  end
end
