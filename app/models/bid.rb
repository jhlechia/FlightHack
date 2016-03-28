class Bid < ActiveRecord::Base
  belongs_to :flights
  belongs_to :users
end
