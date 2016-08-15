class AddUserIdToLists < ActiveRecord::Migration[5.0]
  def change
    add_reference :lists, :user, foreign_key: true
  end
end
