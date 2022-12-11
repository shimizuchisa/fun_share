class Admin::UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  # def edit
    # @user = User.find(params[:id])
  # end

  def update
    @user = User.find(params[:id])
    @use.update(user_params)
    redirect_to admin_user_path(@user)
  end

  private

  def user_params
    params.require(:user).permit(:is_deleted)
  end
end
