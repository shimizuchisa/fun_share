class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = User.find_by(id: params[:user_id])
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @events = @genre.events.page(params[:page]).order(start_time: "ASC")
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @events = @user.events.page(params[:page]).order(start_time: "ASC")
    elsif params[:is_finished]
      @events = Event.where(is_finished: params[:is_finished]).page(params[:page]).order(start_time: "ASC")
    else
      @events = Event.page(params[:page]).order(start_time: "ASC")
    end
    @events = @events.where('title LIKE ?',"%#{params[:search]}%").page(params[:page]).order(start_time: "ASC") if params[:search]
  end

  def show
    @events = Event.all
    @event = Event.find(params[:id])
    @charges = @event.charges.page(params[:page])
    @comments = @event.comments.page(params[:page])
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
    params.require(:event).permit(:genre_id, :user_id, :start_on, :title, :body, :start_time, :end_time, :is_finished)
  end
end
