class RemoveCompletedFromLists < ActiveRecord::Migration[5.0]
  def change
    remove_column :lists, :completed, :boolean
  end
end
