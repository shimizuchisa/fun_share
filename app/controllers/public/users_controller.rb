class Public::UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = current_user
    
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_mypage_path
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :telephone_number)
  end
end
