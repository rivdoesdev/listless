class TasksController < ApplicationController
  def index
    tasks = Task.all
    render locals: {
      tasks: tasks
    }
  end

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
    if task.save
      render json: task
    else
      render :new, locals: {
        task: task
      }
    end
  end

  def edit
    render locals: {
      task: Task.find(params[:id])
    }
  end

  def update
    if Task.exists?(params[:id])
      task.update(task_params)
      redirect_to task
    else
      render :edit
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
  params.require(:task).permit(:title, :completed, :list_id)
end
