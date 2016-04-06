class FlightsController < ApplicationController

  def new
    @flight = Flight.new
  end

  def edit
    @flight = Flight.find(params[:id])
  end

  def create
    @flight = Flight.new(flight_params)
    @flight.save
    redirect_to @flight
  end

  def index
    @flights = Flight.all
    @flight = Flight.new
  end

  def show
    @flight = Flight.find(params[:id])
    if request.xhr?
      render '_flight', layout: false, locals: { flight: @flight }
    end
  end

  def update
    @flight = Flight.find(params[:id])
    if @flight.update(flight_params)
      redirect_to @flight
    else
      render 'edit'
    end
  end

  def destroy
    @flight = Flight.find(params[:id])
    @flight.destroy

    redirect_to flights_path
  end

  private
    def flight_params
      params.require(:flight).permit(:origin, :destination, :airline, :flight_number, :departure_date, :departure_time, :return_date, :return_time, :layover)
    end
end
