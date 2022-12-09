class Public::ChargeController < ApplicationController
  def create
    task = Task.find(params[:task_id])
    charge = current_user.charge.new(task_id: @task.id)
    charge.save
    redirect_to task_path(task)
  end

  def destroy
    task = Task.find(params[:task_id])
    charge = current_user.charges.find(task_id: task.id)
    charge.destroy
    redirect_to task_path(task)
  end

end
