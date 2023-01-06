class Public::EventsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @chareges = @user.charges
    if params[:genre_id]
      @genre = Genre.find(params[:genre_id])
      @events = @genre.events
    elsif params[:user_id]
      @user = User.find(params[:user_id])
      @events = @user.events
    elsif params[:is_finished]
      @events = Event.where(is_finished: params[:is_finished])
    else
      @events = Event.all
    end
    @events = @events.where('title LIKE ?',"%#{params[:search]}%") if params[:search]

  end

  def new
    # @task = Task.new
    @event = Event.new
    # render plain: render_to_string(partial: 'form_new', layout: false, locals: { event: @event })
  end

  def create
    @event = Event.new(event_params)
    @event.user_id = current_user.id
    @event.save
    redirect_to event_path(@event)
  end

  def show
    @events = Event.all
    @event = Event.find(params[:id])
    @charge = Charge.new
    @charges = @event.charges
    @comment = Comment.new
    @comments = @event.comments
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
    params.require(:event).permit(:genre_id, :title, :body, :start_on, :start_time, :end_time, :is_finished)
  end
end
