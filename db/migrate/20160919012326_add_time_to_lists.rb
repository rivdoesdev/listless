class AddTimeToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :time, :time
  end
end
