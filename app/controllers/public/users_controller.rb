class Public::UsersController < ApplicationController
  def edit
  end

  def show
  end
  
  private

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :telephone_number)
  end
end
