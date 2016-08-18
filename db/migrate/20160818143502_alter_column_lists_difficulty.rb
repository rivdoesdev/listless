class AlterColumnListsDifficulty < ActiveRecord::Migration[5.0]
  def change
    change_table :lists do |t|
      t.change :difficulty, :integer
    end
  end
end
