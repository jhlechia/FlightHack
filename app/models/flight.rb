class Flight < ActiveRecord::Base
  has_many :bids
  has_many :users
  validates :origin, :destination, :departure_date, :departure_time, :return_date, :return_time, presence: true
end
