class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @user = User.find_by(id: params[:user_id])
    @events = Event.where.not(is_finished: "completed")
    # タスクを条件検索した場合のタスク一覧
    @events = @events.where(genre_id: params[:genre_id]) if params[:genre_id].present? #ジャンル検索
    @events = @events.where(user_id: params[:user_id]) if params[:user_id].present? #タスク登録者で検索
    @events = @events.where(is_finished: params[:is_finished]) if params[:is_finished].present? #タスク進捗状況で検索
    @events = @events.where('title LIKE ?',"%#{params[:search]}%").or(@events.where('body LIKE ?',"%#{params[:search]}%")) if params[:search].present? #検索ボックスで検索
    @events = @events.order(start_time: "ASC").page(params[:page])
  end

  def show
    @events = Event.all.order(start_time: "ASC")
    @event = Event.find(params[:id])
    @charges = @event.charges.page(params[:page])
    @comments = @event.comments.page(params[:page])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    # start_time、end_timeはdatetime型。 取得した日付dateと時間timeを合わせてdatetimeを生成する
    start_str =  "#{params["event"]["start_on"]} #{params["event"]["start_time(4i)"].to_i}:#{ params["event"]["start_time(5i)"].to_i}"
    @start_time = Time.zone.parse(start_str).to_datetime
    end_str =  "#{params["event"]["start_on"]} #{params["event"]["end_time(4i)"].to_i}:#{ params["event"]["end_time(5i)"].to_i}"
    @end_time = Time.zone.parse(end_str).to_datetime
    @event = Event.find(params[:id])
    if @event.update(event_params.merge(start_time: @start_time, end_time: @end_time))
      redirect_to admin_event_path(@event)
      flash[:notice] = "タスク情報を更新しました"
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to admin_events_path
    flash[:notice] = "イベントを削除しました"
  end

  private

  def event_params
    params.require(:event).permit(:genre_id, :user_id, :title, :body, :is_finished)
  end
end
