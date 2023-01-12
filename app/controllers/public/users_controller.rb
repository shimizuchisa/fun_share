class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user

  def show
    @user = current_user
    @charged_events = @user.charges.order(event_start_time: "ASC")
    @favorited_events = @user.favorites.order(event_start_time: "ASC")
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_mypage_path, notice: '会員情報の更新に成功しました'
    else
      render :edit
    end
  end

  # 退会確認画面
  def unsubscribe
  end

  # 退会処理
  def withdraw
    @user.update(is_deleted: true)
    reset_session #すべてのセッション情報を削除
    redirect_to root_path
  end

  private

  def set_current_user
    @user = current_user
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :telephone_number)
  end
end
