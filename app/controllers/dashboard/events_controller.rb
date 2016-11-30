class Dashboard::EventsController < Dashboard::AdminController
  def index
    @trip = Trip.find(params[:trip_id])
    @events = @trip.events
    respond_to do |format|
      format.html { render :handlers => [:erb]}
      format.json { render :layout => false , :handlers => [:jbuilder]}
    end
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
    redirect_to dashboard_trip_events_path, notice: 'Post was successfully updated.'
  end

  def destroy
    @trip = Trip.find(params[:trip_id])
    @event = @trip.events.find(params[:id])
    @event.destroy
  end
  def get_date
    @trip = Trip.find(params[:trip_id])
    respond_to do |format|
      format.json { render :layout => false , :handlers => [:jbuilder]}
    end
  end
  private

  def event_params
    params.require(:event).permit(:title, :date_range, :start, :end, :color)
  end
end
