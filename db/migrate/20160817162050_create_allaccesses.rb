class CreateAllaccesses < ActiveRecord::Migration[5.0]
  def change
    create_table :allaccesses do |t|
      t.belongs_to :user, foreign_key: true
      t.integer :assignee_id, null: false

      t.timestamps
    end
  end
end
