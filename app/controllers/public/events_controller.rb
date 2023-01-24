class Public::EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :setup_datetime, only: :create

  def index
    @user = current_user
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @events = @genre.events.page(params[:page]).order(start_time: "ASC")
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @events = @user.events.page(params[:page]).order(start_time: "ASC")
    elsif params[:is_finished]
      @events = Event.page(params[:page]).where(is_finished: params[:is_finished]).order(start_time: "ASC")
    else
      @events = Event.page(params[:page]).order(start_time: "ASC")
    end
    @events = @events.page(params[:page]).where('title LIKE ?',"%#{params[:search]}%") if params[:search]
  end

  def new
    # @task = Task.new
    @event = Event.new
    # render plain: render_to_string(partial: 'form_new', layout: false, locals: { event: @event })
  end

  def create
    @event = Event.new(event_params.merge(start_time: @start_time, end_time: @end_time))
    @event.user_id = current_user.id
    @event.save
    redirect_to event_path(@event)
  end

  def show
    @events = Event.all
    @event = Event.find(params[:id])
    @charge = Charge.new
    @charges = @event.charges.page(params[:page])
    @comment = Comment.new
    @comments = @event.comments.page(params[:page])
    @favorite = Favorite.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :title, :body, :start_time, :end_time, :is_finished)
  end

  def setup_datetime
    datetime = DateTime.parse(params["event"]["start_on"])
    @start_time = datetime.change(hour: params["event"]["start_time(4i)"].to_i, min: params["event"]["start_time(5i)"].to_i)
    @end_time = datetime.change(hour: params["event"]["end_time(4i)"].to_i, min: params["event"]["end_time(5i)"].to_i)
  end
end
