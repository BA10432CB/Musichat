class Admin::PostCommentsController < ApplicationController
  before_action :authenticate_admin!

  def destroy
    @post_comment = PostComment.find_by(id: params[:id], post_id: params[:post_id])
    @post_comment.destroy
    redirect_to admin_post_path(@post_comment.post)
  end

  private

  def post_comment_params
    params.require(:post_comment).permit(:comment)
  end
end
