class Flight < ActiveRecord::Base
  validates :origin, :destination, :departure_date, :departure_time, :return_date, :return_time, presence: true
end
