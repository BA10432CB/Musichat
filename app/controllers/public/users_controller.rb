class Public::UsersController < ApplicationController
  before_action :ensure_guest_user, only: [:edit]
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    @posts = @user.posts
  end

  def favorite
    @user = User.find(params[:id])
    favorites= Favorite.where(user_id: @user.id).pluck(:post_id)
    @favorite_posts = Post.find(favorites)
  end

  def edit
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
  end

  def update
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to user_path(current_user)
    end
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render "edit"
    end
  end

  def unsubscribe
    @user = current_user
  end

  def withdrawal
    @user = current_user
    # is_active(会員ステータス)をfalse(退会)に更新する
    @user.update(is_active: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :is_active, :profile_image, :introduction)
  end

  def ensure_guest_user
    @user = User.find(params[:id])
    if @user.guest_user?
      redirect_to user_path(current_user) , notice: "ゲストユーザーはプロフィール編集画面へ遷移できません。"
    end
  end
end
