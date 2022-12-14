class Public::ChargesController < ApplicationController
  def create
    task = Task.find(params[:task_id])
    charge = Charge.new
    charge.user_id =current_user.id
    charge.task_id =task.id
    charge.save
    redirect_to task_path(task)
  end

  def destroy
    task = Task.find(params[:task_id])
    charge = current_user.charges.find_by(task_id: task.id)
    charge.destroy
    redirect_to task_path(task)
  end

end
