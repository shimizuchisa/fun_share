class Admin::UsersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @users = User.page(params[:page])
  end

  def show
    @user = User.find(params[:id])
    @comments = @user.comments.order(created_at: "ASC").page(params[:page])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to admin_user_path(@user)
      flash[:notice] = "会員情報が更新されました"
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :telephone_number, :email, :is_deleted)
  end
end
