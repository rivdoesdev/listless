class PermissionsController < ApplicationController
  def index
    permissions = Permission.all
    render locals: {
      permissions: permissions
    }
  end

  def new
    render locals: { permission: Permission.new }
  end

  def create
    permission = Permission.new(permission_params)
    if permission.save
      flash[:notice] = 'Permission created!'
      redirect_to permission.list
    else
      flash[:alert] = permission.errors.full_messages
      redirect_to permission.list
    end
  end

  def destroy
    permission = Permission.find(params[:id])
    if has_permission?(permission.list)
        permission.destroy
        flash[:notice] = 'This user no longer has extra permissions.'
        redirect_to :back
    else
      flash[:alert] = 'You cannot delete this permission.'
      redirect_to :back
    end
  end
end

private
def permission_params
  params.require(:permission).permit(:user_id, :list_id, :all_access, :public)
end

def has_permission?(list)
  list.user_id == current_user.id || current_user.admin?
end
