class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @like = current_user.likes.build(like_params)

    if @like.save
      redirect_to posts_path
    else
      redirect_to posts_path, status: :unprocessable_entity
    end
  end

  private

  def like_params
    params.require(:like).permit(:post_id)
  end
end
