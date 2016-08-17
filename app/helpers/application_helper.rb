module ApplicationHelper
  def no_permission_users(list)
    User.all - (list.users_with_access | [list.user])
  end
end
