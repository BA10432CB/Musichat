class Public::PostsController < ApplicationController
  before_action :authenticate_user!

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @genres = Genre.all
    url = params[:post][:song_url]
    url = url.last(11)
    @post.song_url = url
    @post.user_id = current_user.id
    if @post.save
      redirect_to posts_path
    else
      render 'new'
    end
  end

  def index
    @posts = Post.all.order(created_at: :desc)
  end

  def show
    @post = Post.find(params[:id])
    @post_comment = PostComment.new
  end

  def destroy
    @post = Post.find(params[:id])
    unless @post.user == current_user
      redirect_to posts_path
    end
    @post.destroy
    redirect_to posts_path
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :star, :image, :genre_id)
  end
end