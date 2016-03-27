class FlightsController < ApplicationController
  def new
    @flight = Flight.new
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.save
    redirect_to @flight
  end

  def index
    @flights = Flight.all
  end

  def show
    @flight = Flight.find(params[:id])
  end

  def destroy
    @flight = Find.find(params[:id])
    @flight.destroy

    redirect_to flights_path
  end

  private
    def flight_params
      params.require(:flight).permit(:origin, :destination, :airline, :flight_number, :departure_date, :departure_time, :return_date, :return_time)
    end
end
