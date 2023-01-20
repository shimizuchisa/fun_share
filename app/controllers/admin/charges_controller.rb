class Admin::ChargesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @charges = @user.charges.page(params[:page]).order(event_start_time: "ASC")
  end
end
