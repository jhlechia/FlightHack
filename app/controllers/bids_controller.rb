class BidsController < ApplicationController
  def show
    @bid = Bid.find(params[:id])
  end

  def new
    @flight = Flight.find(params[:flight_id])
    @bid = @flight.bids
  end

  def create
    @flight = Flight.find(params[:flight_id])
    @bid = @flight.bids.new(bid_params)
    respond to do |format|
      if @bid.save
        format.html {redirect to @flight, notice: 'Your bid has been placed.'}
      else
        format.html { render action: 'new' }
      end
    end
  end

  private

  def bid_params
    params[:bid][:user_id] = current_user.id
    params[:bid].permit(:user_id, :item_id)
  end
end
