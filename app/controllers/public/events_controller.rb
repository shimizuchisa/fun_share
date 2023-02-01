class Public::EventsController < ApplicationController
  before_action :authenticate_user!
  # before_action :setup_datetime, only: [:create, :update]

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
    @event = Event.new
  end

  def create
    start_str =  "#{params["event"]["start_on"]} #{params["event"]["start_time"].to_i}}"
    @start_time = Time.zone.parse(start_str).to_datetime
    end_str =  "#{params["event"]["start_on"]} #{params["event"]["end_time"].to_i}}"
    @end_time = Time.zone.parse(end_str).to_datetime
    @event = Event.new(event_params.merge(start_time: @start_time, end_time: @end_time))
   # @event = Event.new(event_params)
    @event.user_id = current_user.id
    if @event.save
      redirect_to event_path(@event)
      flash[:notice] = "タスクを登録しました"
    else
      @event = Event.new
      render :new
    end
  end

  def show
    @events = Event.all.order(start_time: "ASC")
    @event = Event.find(params[:id])
    @charge = Charge.new
    @charges = @event.charges.page(params[:page])
    @comments = @event.comments.page(params[:page])
    @comment = Comment.new
    @favorite = Favorite.new

  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    start_str =  "#{params["event"]["start_on"]} #{params["event"]["start_time(4i)"].to_i}:#{ params["event"]["start_time(5i)"].to_i}"
    @start_time = Time.zone.parse(start_str).to_datetime
    end_str =  "#{params["event"]["start_on"]} #{params["event"]["end_time(4i)"].to_i}:#{ params["event"]["end_time(5i)"].to_i}"
    @end_time = Time.zone.parse(end_str).to_datetime
    @event = Event.find(params[:id])
    if @event.update(event_params.merge(start_time: @start_time, end_time: @end_time))
      redirect_to event_path(@event)
      flash[:notice] = "タスク情報を更新しました"
    else
      flash[:alert] = "全ての項目を入力してください"
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :title, :body, :is_finished)
  end

  def setup_datetime
    #datetime = DateTime.parse(params["event"]["start_on"])
    # @start_time = datetime.change(hour: params["event"]["start_time(4i)"].to_i, min: params["event"]["start_time(5i)"].to_i)
    #@end_time = datetime.change(hour: params["event"]["end_time(4i)"].to_i, min: params["event"]["end_time(5i)"].to_i)




  end
end
