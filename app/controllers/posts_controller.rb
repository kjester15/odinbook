class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)

    if @post.save
      redirect_to post_path(@post.id)
    else
      redirect_to new_post_path, status: :unprocessable_entity
    end
  end

  private

  def post_params
    params.require(:post).permit(:content, :user_id)
  end
end
