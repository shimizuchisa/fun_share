class Admin::ChargesController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @charges = @user.charges.order(event_start_time: "ASC").page(params[:page])
  end
end
