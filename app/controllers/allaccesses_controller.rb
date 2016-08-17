class AllaccessesController < ApplicationController
  def create
    allaccess = Allaccess.new(allaccess_params)
    allaccess.user = current_user
    if allaccess.save
      redirect_to :back
    else
      render :new, locals: {
        allaccess: allaccess
      }
    end
  end

  def destroy
    allaccess = Allaccess.find(params[:id])
    allaccess.user = current_user
    if allaccess
        allaccess.destroy
        flash[:notice] = 'This user can no longer has access to all your lists.'
        redirect_to :back
    else
      flash[:alert] = 'You cannot delete this permission.'
      redirect_to :back
    end
  end
end

private
def allaccess_params
  params.require(:allaccess).permit(:user_id, :assignee_id)
end
