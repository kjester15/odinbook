class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      redirect_to posts_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])

    if @comment.update(comment_params)
      redirect_to posts_path
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to posts_path
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
