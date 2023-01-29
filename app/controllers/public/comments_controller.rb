class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find_by(id: params[:event_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.event_id = @event.id
    if @comment.save
      redirect_to event_path(@event)
    else
      events = Event.all
      render events_path
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
