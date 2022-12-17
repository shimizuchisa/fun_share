class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @tasks = Task.all
  end

  def show
    @task = Task.find(params[:id])
    @charges = @task.charges
    @comments = @task.comments
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    @task.update(task_params)
    redirect_to admin_task_path(@task)
  end

  private

  def task_params
    params.require(:task).permit.(:genre_id, :user_id, :title, :body, :start_time, :end_time, :is_finished)
  end
end
