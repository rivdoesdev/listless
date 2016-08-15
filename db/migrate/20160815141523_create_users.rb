class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.string :email, null: false, uniqueness: true
      t.string :password
      t.string :birthday
      t.string :phone_number
      t.text :about_me

      t.timestamps
    end
  end
end
