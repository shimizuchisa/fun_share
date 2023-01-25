class Admin::GenresController < ApplicationController
  before_action :authenticate_admin!

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      flash[:notice] = "ジャンルを登録しました"
      @genres = Genre.all
      redirect_to admin_genres_path
      flash[:notice] = "ジャンルを登録しました"
    else
      flash[:alert] = "ジャンル名は２〜１０文字以内で入力してください"
      @genres = Genre.all
      render :index
      flash[:alert] = "ジャンル名は２〜１０文字以内で入力してください"
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    @genre.update(genre_params)
    @genres = Genre.all
    redirect_to admin_genres_path
    flash[:notice] = "会員情報を更新しました"
  end

  private

  def genre_params
    params.require(:genre).permit(:name)
  end

end