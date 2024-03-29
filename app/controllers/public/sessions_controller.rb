# frozen_string_literal: true

class Public::SessionsController < Devise::SessionsController
  before_action :reject_inactive_user, only: [:create]

  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end

  def after_sign_in_path_for(resource)
    users_mypage_path
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # 退会会員の再ログイン禁止
  def reject_inactive_user
    #【処理内容1】 入力されたemailからアカウントを1件取得
    @user = User.find_by(email: params[:user][:email])
    # アカウントを取得できなかった場合、このメソッドを終了する
    return if !@user
    if @user.valid_password?(params[:user][:password]) && @user.is_deleted
      flash[:danger] = 'この会員は退会済みです。'
      redirect_to new_user_registrations_path
    end
  end

  # ゲストログイン用メソッド
  def guest_sign_in
    user = User.guest
    sign_in user
    redirect_to root_path
  end
end
