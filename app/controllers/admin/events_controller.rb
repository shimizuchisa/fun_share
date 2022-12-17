class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
    @charges = @event.charges
    @comments = @event.comments
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to admin_event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit.(:genre_id, :user_id, :title, :body, :start_time, :end_time, :is_finished)
  end
end
