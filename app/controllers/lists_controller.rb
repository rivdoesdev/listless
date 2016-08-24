class ListsController < ApplicationController
  before_action :require_login, except: [:public_index, :public_show]

  def index
    if params[:search]
      search_params
    else
      lists = List.all
      render locals: {
        lists: lists,
      }
    end
  end

  def public_index
    lists = List.where(public: true)
    render locals: {
      lists: lists
    }
  end

  def one_index
    lists = List.where(difficulty: 1)
    render locals: {
      lists: lists
    }
  end

  def two_index
    lists = List.where(difficulty: 1) && List.where(difficulty: 2)
    render locals: {
      lists: lists
    }
  end

  def three_index
    lists = List.where(difficulty: 1) && List.where(difficulty: 2) &&
    List.where(difficulty: 3)
    render locals: {
      lists: lists
    }
  end

  def four_index
    lists = List.all - List.where(difficulty: 5)
    render locals: {
      lists: lists
    }
  end

  def five_index
    lists = List.all
    render locals: {
      lists: lists
    }
  end

  def archived_index
    lists = List.where(archived: true)
    render locals: {
      lists: lists
    }
  end

  def show
    list = List.find(params[:id])
    if list
      if has_permission?(list)
        render locals: {
        list: list, permission: Permission.new, startover: Startover.new
        }
      else
        flash[:alert] = "You do not have permission to view this page."
        redirect_to root_path
      end
      else
        render html: { message: "List not found" }, status: 404
    end
  end

  def public_show
    list = List.find(params[:id])
    if list.public?
        render locals: {
        list: list
        }
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
      flash[:notice] = "List archived!"
      redirect_to lists
      else
        flash[:alert] = "You do not have permission to archive this list."
      end
    else
      flash[:alert] = list.errors
    end
  end

  def flop
      list = List.find(params[:id])
      list.archived = !list.archived || !list.archived = list.archived
      list.save

      redirect_to list_path(list)
  end
end


private
def list_params
  params.require(:list).permit(:title, :difficulty, :energy, :due_date, :reward, :public, :archived, :user_id)
end
