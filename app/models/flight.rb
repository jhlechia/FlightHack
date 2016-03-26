class Flight < ActiveRecord::Base
  validates :origin, :destination, :departure_date, :departure_time, :return_date, :return_time, presence: true
  validates :username, presence: true, uniqueness: true
end
