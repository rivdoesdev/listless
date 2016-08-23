class CreateStartoverLists < ActiveRecord::Migration[5.0]
  def change
    create_table :startover_lists do |t|
      t.belongs_to :user, foreign_key: true
      t.belongs_to :list, foreign_key: true
      t.boolean :completed
      t.boolean :archived

      t.timestamps
    end
  end
end
