class Public::ChargesController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    charge = Charge.new
    charge.user_id =current_user.id
    charge.event_id =event.id
    charge.save
    redirect_to event_path(event)
  end

  def destroy
    event = Event.find(params[:event_id])
    charge = current_user.charges.find_by(event_id: event.id)
    charge.destroy
    redirect_to event_path(event)
  end

end
