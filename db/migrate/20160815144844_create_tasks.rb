class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :title, null: false
      t.text :description
      t.integer :position
      t.boolean :completed, default: false
      t.belongs_to :list, foreign_key: true

      t.timestamps
    end
  end
end
