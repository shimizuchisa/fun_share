class Public::TasksController < ApplicationController
  before_action :authenticate_user!
  
  def index
    # @tasks = Task.all
    @events = Task.all
  end

  def new
    # @task = Task.new
    @event = Task.new
    render plain: render_to_string(partial: 'form_new', layout: false, locals: { event: @event })
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
    @favorite = Favorite.new
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
