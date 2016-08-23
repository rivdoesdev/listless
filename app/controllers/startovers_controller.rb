class StartoversController < ApplicationController
  def index
    if params[:search]
      search_params
    else
      startovers = Startover.all
      render locals: {
        startovers: startovers,
      }
    end
  end

  def show
    if Startover.exists?(params[:id])
    render locals: {
      startover: Startover.find(params[:id])
    }
    else
      render html: { message: "We couldn't find that!"}, status: 404
    end
  end

  def new
    render locals: {
      startover: Startover.new
    }
  end

  def create
    startover = Startover.new(so_params)
    if startover.save
      redirect_to startovers_path
    else
      render :new, locals: {
        startover: startover
      }
    end
  end

  def edit
    render locals: {
      startover: Startover.find(params[:id])
    }
  end

  def update
    startover = Startover.find(params[:id])
    if startover
      startover.update(so_params)
      redirect_to startovers_path
      flash[:alert] = "Updated"
    else
      render :edit, locals: {
        startover: startover
      }
    end
  end

  def flop
      startover = Startover.find(params[:id])
      startover.archived = !startover.archived || !startover.archived = startover.archived
      startover.save

      redirect_to startovers_path
  end
end

private
def so_params
  params.require(:startover).permit(:user_id, :completed, :archived, :list_id)
end
