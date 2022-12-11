class Public::UsersController < ApplicationController


  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def edit
    @user = current_user
    @user.update(user_params)
    redirect_to user_mypage(@user)
  end

  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :telephone_number)
  end
end
