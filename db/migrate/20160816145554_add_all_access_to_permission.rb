class AddAllAccessToPermission < ActiveRecord::Migration[5.0]
  def change
    add_column :permissions, :all_access, :boolean
  end
end
