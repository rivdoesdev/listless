class RemovePrivateFromLists < ActiveRecord::Migration[5.0]
  def change
    remove_column :lists, :private, :boolean
  end
end
