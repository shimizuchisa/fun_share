class Public::FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    event = Event.find(params[:event_id])
    favorite = current_user.favorites.new(event_id: event.id)
    favorite.event_start_time = event.start_time
    favorite.save
    redirect_to event_path(event)
  end

  def destroy
    event = Event.find(params[:event_id])
    favorite = current_user.favorites.find_by(event_id: event.id)
    favorite.destroy
    redirect_to event_path(event)
  end

end
