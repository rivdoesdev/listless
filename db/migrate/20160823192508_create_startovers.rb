class CreateStartovers < ActiveRecord::Migration[5.0]
  def change
    create_table :startovers do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :list, foreign_key: true
      t.boolean :completed, default: false
      t.boolean :archived, default: false

      t.timestamps
    end
  end
end
