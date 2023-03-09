class Public::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @event = Event.find(params[:event_id])
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    @comment.event_id = @event.id
    if @comment.save
      redirect_to event_path(@event)
    else
      @events = Event.all.order(start_time: "ASC")
      @event = Event.find_by(id: params[:event_id])
      @charge = Charge.new
      @charges = @event.charges.page(params[:page])
      @comments = @event.comments.page(params[:page])
      @favorite = Favorite.new
      render template: 'public/events/show'
    end
  end

  def destroy
    @event = Event.find_by(id: params[:event_id])
    @comment = Comment.find_by(id: params[:comment_id])
    @comment.destroy
    redirect_to event_path(@event)
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end
end
