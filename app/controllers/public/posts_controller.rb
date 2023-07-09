class Public::PostsController < ApplicationController
  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    @post.save
    redirect_to posts_path
  end

  def index
    @posts = Post.page(params[:page])
  end

  def show
  end

  def destroy
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :star, :image)
  end
end