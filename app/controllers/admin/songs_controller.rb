class Admin::SongsController < ApplicationController
  # before_action :set_select_genres
  # before_action :set_select_composers

  def new
    @genres = Genre.all
    @composers = Composer.all
    @song = Song.new
  end

  def create
    @song = Song.new(song_params)
    if @song.save
      redirect_to admin_songs_path
    else
      render 'new'
    end
  end

  def index
    @genres = Genre.all
    @composers = Composer.all
    @songs = Song.all
    @song = Song.new
  end

  def show
    @song = Song.find(params[:id])
  end

  def edit
    @genres = Genre.all
    @composers = Composer.all
    @song = Song.find(params[:id])
  end

  def update
    @song = Song.find(params[:id])
    if @song.update(song_params)
      redirect_to admin_songs_path
    else
      render 'edit'
    end
  end

  def destroy
    @song = Song.find(params[:id])
    @song.destroy
    redirect_to admin_songs_path
  end

  private

  def song_params
    params.require(:song).permit(:name, :genre_id, :composer_id)
  end

#   def set_select_genres
#     @genres = Genre.all.map {|genre| [genre.name, genre.id] }.unshift(["--選択してください--", nil])
#   end

#   def set_select_composers
#     @composers = Composer.all.map {|composer| [composer.name, composer.id] }.unshift(["--選択してください--", nil])
#   end
end
