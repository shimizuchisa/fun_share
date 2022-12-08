class Admin::GenresController < ApplicationController

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.save
    @genres = Genre.all
    redirect_to admin_genres_index_path
  end

  def edit
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    @genres = Genre.all
    redirect_to 'index'
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end