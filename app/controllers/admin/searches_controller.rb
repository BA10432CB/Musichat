class Admin::SearchesController < ApplicationController
  # before_action :authenticate_admin!

  def search
    @word = params[:word]
    @model = params[:model]
    @users = User.looks(params[:search], params[:word])
    @posts = Post.looks(params[:search], params[:word])
    @songs = Song.looks(params[:search], params[:word])
  end
end
