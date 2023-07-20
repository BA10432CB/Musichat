class Public::UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts
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
      redirect_to user_path(@users)
    else
      render "edit"
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :is_active, :profile_image, :introduction)
  end
end
