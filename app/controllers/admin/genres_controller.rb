class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      @genres = Genre.all
      redirect_to admin_genres_path
      flash[:notice] = "ジャンルを登録しました"
    else
      @genres = Genre.all
      render :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      @genres = Genre.all
      redirect_to admin_genres_path
      flash[:notice] = "ジャンル情報を更新しました"
    else
      render :edit
    end
  end

  private

  def genre_params
    params.require(:genre).permit(:name, :is_deleted)
  end

end