class PostsController < ApplicationController
  def index
    @followees = []
    current_user.followees.each do |followee|
      @followees << followee.id
    end
    @posts = Post.where(user_id: current_user).or(Post.where(user_id: @followees)).order(id: :desc)
  end

  def show
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        # redirect_to posts_path(@post.id)
        format.turbo_stream
      else
        # render :new, status: :unprocessable_entity
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])

    respond_to do |format|
      if @post.update(post_params)
        # redirect_to posts_path(@post.id)
        format.turbo_stream
      else
        # render :new, status: :unprocessable_entity
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:content)
  end
end
