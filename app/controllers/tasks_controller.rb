class TasksController < ApplicationController
  before_action :require_login

  def show
    if Task.exists?(params[:id])
    render locals: {
      task: Task.find(params[:id])
    }
    else
      render html: { message: "Task not found"}, status: 404
    end
  end

  def new
    render locals: {
      task: Task.new
    }
  end

  def create
    task = Task.new(task_params)
    if params[:task][:parent_task_id].present?
      task.list = Task.find(params[:task][:parent_task_id]).list
    end
    if task.save
      if task.parent_task_id.nil?
        redirect_to task.list
      else
        redirect_to task.parent
      end
    else
      render :new, locals: {
        task: task
      }
    end
  end

  def edit
    render locals: {
      list_id: params[:list_id],
      task: Task.find(params[:id])
    }
  end

  def update
    task = Task.find(params[:id])
    if task
      task.update(task_params)
      if task.parent_task_id.nil?
        redirect_to task.list
      else
        redirect_to task.parent
      end
      flash[:alert] = "Updated"
    else
      render :edit, locals: {
        task: task,
        list_id: params[:list_id]
      }
    end
  end

  def destroy
    if Task.exists?(params[:id])
      Task.destroy(params[:id])
      flash[:notice] = "Task removed"
      redirect_to task.list
    else
      flash[:alert] = "Task was not destroyed due to errors."
    end
  end
end

private
def task_params
  params.require(:task).permit(:title, :description, :position, :completed, :list_id, :parent_task_id)
end
