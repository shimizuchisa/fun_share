class Public::ChargesController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    charge = Charge.new
    charge.user_id =current_user.id
    charge.event_id =event.id
    charge.event_start_time =event.start_time
    charge.save
    redirect_to event_path(event)
  end

  def index
    @user = current_user
    @charges = @user.charges.order(event_start_time: "ASC").page(params[:page])
  end

  def destroy
    event = Event.find(params[:event_id])
    charge = current_user.charges.find_by(event_id: event.id)
    charge.destroy
    redirect_to event_path(event)
  end

end
