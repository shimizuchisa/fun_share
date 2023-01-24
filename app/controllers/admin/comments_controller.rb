class Admin::CommentsController < ApplicationController
  before_action :authenticate_admin!
  !
  def index
    @comments = Comment.all
  end

  def destroy
    @comment = Comment.find(params[:id])
    @event = Event.find(params[:event_id])
    if @comment.delete
      redirect_to admin_event_path(@event)
    else
      render admin_event_path(@event)
    end
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
