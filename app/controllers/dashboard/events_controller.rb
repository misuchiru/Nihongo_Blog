class Dashboard::EventsController < Dashboard::AdminController

  def index
    @trip = Trip.find(params[:trip_id])
    @events = @trip.where(start: params[:start]..params[:end])
  end

  def show
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events.new
  end

  def edit
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events.find(params[:id])
  end

  def create
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events.new(event_params)
    @event.save
  end

  def update
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events.find(params[:id])
    @event.update(event_params)
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events.find(params[:id])
    @event.destroy
  end

  private

  def event_params
    params.require(:event).permit(:title, :date_range, :start, :end, :color)
  end
end
