class ListsController < ApplicationController
  before_action :require_login

  def index
    lists = List.all
    render locals: {
      lists: lists
    }
  end

  def show
    list = List.find(params[:id])
    if list
      if has_permission?(list)
        render locals: {
        list: list, permission: Permission.new
        }
      else
        flash[:alert] = "You do not have permission to view this page."
        redirect_to root_path
      end
      else
        render html: { message: "List not found" }, status: 404
    end
  end

  def new
    render locals: {
      list: List.new
    }
  end

  def create
    list = List.new(list_params)
    list.user = current_user
    if list.save
      redirect_to list
    else
      render :new, locals: {
        list: list
      }
    end
  end

  def edit
    render locals: {
      list: List.find(params[:id])
    }
  end

  def update
    if List.exists?(params[:id])
      List.update(list_params)
      redirect_to list_path
    else
      render :edit
    end
  end

  def destroy
    list = List.find(params[:id])
    if list
      if has_permission?(list)
      list.destroy
      flash[:notice] = "List removed"
      redirect_to lists
      else
        flash[:alert] = "You do not have permission to delete this list."
      end
    else
      flash[:alert] = list.errors
    end
  end
end

private
def list_params
  params.require(:list).permit(:title, :difficulty, :energy, :due_date, :reward, :completed, :user_id)
end
