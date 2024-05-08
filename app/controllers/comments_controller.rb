class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      redirect_to posts_path
    else
      redirect_to posts_path, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:post_id)
  end
end
