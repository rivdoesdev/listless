class AddPublicToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :public, :boolean
  end
end
