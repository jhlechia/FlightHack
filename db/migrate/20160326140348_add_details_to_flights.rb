class AddDetailsToFlights < ActiveRecord::Migration
  def change
    add_column :flights, :airline, :string
    add_column :flights, :flight_number, :string
  end
end
