class TripsController < ApplicationController

  def index
    @trips = @paginate = Trip.order('id DESC').paginate(:page => params[:page])
  end

  def show
    @trip = Trip.find(params[:id])
    @event = @trip.events
  end
  def get_date
    @trip = Trip.find(params[:id])
  end

end