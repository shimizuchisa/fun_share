class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  !
  def index
    @user = User.find_by(id: params[:user_id])
    @comments = @user.comments.page(params[:page])
  end

  def destroy
    # １コメント削除したら、イベント詳細に戻る
    @event = Event.find_by(id: params[:event_id])
    @comment = @event.comments.find_by(id: params[:comment_id])
    @comment.destroy
    redirect_to admin_event_path(@event)
  end

  def event_destroy_all
    @event = Event.find(params[:event_id])
    @comments = @event.comments
    @comments.destroy_all
    redirect_to admin_event_path(@event)
  end

  def user_destroy_all
    @user = User.find(params[:user_id])
    @comments = @user.comments
    @comments.destroy_all
    redirect_to admin_user_path(@user)
  end
end
