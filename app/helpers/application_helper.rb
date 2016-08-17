module ApplicationHelper
  def no_permission_users(list)
    User.all - (list.allowed_users | [list.user])
  end
end
