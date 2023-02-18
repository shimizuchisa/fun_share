class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def index
    @user = User.find_by(id: params[:user_id])
    @comments = @user.comments.page(params[:page])
  end

  def destroy
    @event = Event.find_by(id: params[:event_id])
    @comment = @event.comments.find_by(id: params[:comment_id])
    @comment.destroy
    redirect_to admin_event_path(@event)
  end

  # タスク単位で投稿コメントを一括削除
  def destroy_all
    @event = Event.find_by(id: params[:event_id])
    @event.comments.destroy_all
    redirect_to admin_event_path(@event)
  end
end
