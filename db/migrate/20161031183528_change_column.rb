class ChangeColumn < ActiveRecord::Migration[5.0]
  def change
    change_table :lists do |t|
      t.change :due_date, :datetime
    end
  end
end
