class Dashboard::TripsController < Dashboard::AdminController
  before_action :set_trip, only: [:show, :edit, :update, :destroy]

  # GET /trips
  # GET /trips.json
  def index
    @trips = @paginate = Trip.order('id DESC').paginate(:page => params[:page])
  end

  # GET /trips/1
  # GET /trips/1.json
  def show
  end

  # GET /trips/new
  def new
    @trip = current_user.trips.new
  end

  # GET /trips/1/edit
  def edit
  end

  # trip /trips
  # trip /trips.json
  def create
    @trip = current_user.trips.new(trip_params)

    if @trip.save
      redirect_to dashboard_trips_path, notice: 'trip was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /trips/1
  # PATCH/PUT /trips/1.json
  def update
    if @trip.update(trip_params)
      redirect_to dashboard_trips_path, notice: 'trip was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /trips/1
  # DELETE /trips/1.json
  def destroy
    @trip.destroy
    redirect_to dashboard_trips_path, notice: 'trip was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_trip
    @trip = current_user.trips.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def trip_params
    params.require(:trip).permit(:name, :date_range, :start_date, :end_date, :img, :description, :status)
  end
end
