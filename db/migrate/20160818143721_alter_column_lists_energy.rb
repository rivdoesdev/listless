class AlterColumnListsEnergy < ActiveRecord::Migration[5.0]
  def change
    change_table :lists do |t|
      t.change :energy, :integer
    end
  end
end
