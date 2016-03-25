class CreateFlights < ActiveRecord::Migration
  def change
    create_table :flights do |t|
      t.string :origin
      t.string :destination
      t.string :departure_date
      t.string :departure_time
      t.string :return_date
      t.string :return_time
      t.boolean :layover

      t.timestamps null: false
    end
  end
end
