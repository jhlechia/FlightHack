class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.date :birthday
      t.string :username
      t.string :password
      t.string :password_confirm

      t.timestamps null: false
    end
  end
end
