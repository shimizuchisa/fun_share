class Public::TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.user_id = current_user.id
    @task.save
    redirect_to task_path(@task)
  end

  def show
    @task = Task.find(params[:id])
    @charge = Charge.new
    @charges = @task.charges
    @comment = Comment.new
    @comments = @task.comments
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to task_path(@task)
  end

  private

  def task_params
   params.require(:task).permit(:genre_id, :title, :body, :start_time, :end_time, :is_finished)
  end
end
