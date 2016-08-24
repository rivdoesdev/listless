class StartoversController < ApplicationController
  def create
    so = Startover.find_or_create_by(so_params)
    redirect_to so.list
  end

  def update
    startover = Startover.find_by(id: params[:id])
    if startover
      startover.update(so_params)
      redirect_to startover.list
      flash[:alert] = "Updated"
    else
      redirect_to :back
    end
  end


  private
  def so_params
    params.require(:startover).permit(:user_id, :completed, :list_id)
  end
end
