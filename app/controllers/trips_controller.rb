class TripsController < ApplicationController

  def index
    @trips = @paginate = Trip.published.order('id DESC').paginate(:page => params[:page])
  end

  def show
    @trip = Trip.find(params[:id])
    @event = @trip.events
    set_page_title @trip.name
    set_page_description view_context.truncate(@trip.description, :length => 100)
    set_page_keywords @trip.name
  end
  def get_date
    @trip = Trip.find(params[:id])
  end

end
