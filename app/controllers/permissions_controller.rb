class PermissionsController < ApplicationController
  def index
    permissions = Permission.for_user(current_user)
    render locals: {
      permissions_grouped_by_list: permissions.group_by { |permission| permission.list },
      allaccess: Allaccess.new
    }
  end


  def new
    render locals: { permission: Permission.new }
  end

  def create
    permission = Permission.new(permission_params)
    if permission.save
      flash[:notice] = "#{permission.user.name} can now see this list."
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
        flash[:notice] = "#{permission.user.name} no longer has extra permissions."
        redirect_to :back
    else
      flash[:alert] = 'You cannot delete this permission.'
      redirect_to :back
    end
  end
end

private
def permission_params
  params.require(:permission).permit(:user_id, :list_id, :public)
end
