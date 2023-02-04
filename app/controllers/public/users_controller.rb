class Public::UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_current_user
  before_action :ensure_normal_user, only: [:update]

  def show
    @user = current_user
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to users_mypage_path, notice: '会員情報の更新に成功しました'
    else
      flash[:alert] = "入力内容に空欄があります"
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

  def ensure_normal_user
    if current_user.email == "guest@example.com"
      flash[:alert] = "ゲストユーザーの情報の編集はできません"
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:last_name, :first_name, :email, :telephone_number)
  end
end
