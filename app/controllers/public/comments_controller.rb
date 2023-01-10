class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
    @comment.user_id =current_user.id
    @comment.event_id =@event.id
    if @comment.save
      redirect_to event_path(@event)
    else
      render event_path(@event)
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
