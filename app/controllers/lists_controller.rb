class ListsController < ApplicationController
  before_action :require_login

  def index
    lists = List.all
    render locals: {
      lists: lists
    }
  end

  def show
    if List.exists?(params[:id])
    render locals: {
      list: List.find(params[:id])
    }
    else
      render html: { message: "List not found"}, status: 404
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
      render json: list
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
    if List.exists?(params[:id])
      List.destroy(params[:id])
      flash[:notice] = "List removed"
      redirect_to lists
    else
      flash[:alert] = "List was not destroyed due to errors."
    end
  end
end

private
def list_params
  params.require(:list).permit(:title, :difficulty, :energy, :completed, :user_id)
end
