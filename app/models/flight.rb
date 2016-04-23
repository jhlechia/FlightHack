class Flight < ActiveRecord::Base
  has_many :bids
  belongs_to :user
  validates :origin, :destination, :departure_date, :departure_time, :return_date, :return_time, presence: true
end
