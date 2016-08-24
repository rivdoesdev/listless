class RemoveArchivedFromStartovers < ActiveRecord::Migration[5.0]
  def change
    remove_column :startovers, :archived, :boolean
  end
end
