module ApplicationHelper
  def no_permission_users(list)
    User.all - (list.allowed_users | [list.user])
  end

  def no_access_users(user)
    User.all - (user.users_with_access | [current_user])
  end
end
