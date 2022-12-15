class Public::CommentsController < ApplicationController
  before_action :authenticate_user!
  
  def create
    task = Task.find(params[:task_id])
    @comment = Comment.new(comment_params)
    @comment.user_id =current_user.id
    @comment.task_id =task.id
    @comment.save
    redirect_to task_path(task)
  end

  private

  def comment_params
    params.require(:comment).permit(:comment)
  end
end
