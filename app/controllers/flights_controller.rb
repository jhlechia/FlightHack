class FlightsController < ApplicationController
  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.save
    redirect_to @flight
  end

  private
    def flight_params
      params.require(:flight).permit(:origin, :destination, :departure_date, :departure_time, :return_date, :return_time)
    end
end
