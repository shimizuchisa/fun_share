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

end
