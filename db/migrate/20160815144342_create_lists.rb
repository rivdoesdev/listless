class CreateLists < ActiveRecord::Migration[5.0]
  def change
    create_table :lists do |t|
      t.string :title, null: false
      t.string :difficulty, null: false
      t.string :energy, null: false
      t.date :due_date
      t.string :reward
      t.boolean :completed, default: false

      t.timestamps
    end
  end
end
