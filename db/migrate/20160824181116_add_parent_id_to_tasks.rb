class AddParentIdToTasks < ActiveRecord::Migration[5.0]
  def change
    add_column :tasks, :parent_task_id, :integer
  end
end
