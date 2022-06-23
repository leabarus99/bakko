class TripsController < ApplicationController
  before_action :authenticate_user!
  def index
    @trips = Trip.all


  end

  def show
    @trip = Trip.find(params[:id])
  end

  def new
    @trip = Trip.new
  end

  def create
    @trip = Trip.new(trip_params)
    @activities = Activity.where(name: params[:trip][:activities])
    @trip.activities = @activities
    @trip.user = current_user
    if @trip.save
      redirect_to equipments_trip_path(@trip)
    else
      render :new
    end
  end

  def equipments
    @trip = Trip.find(params[:id])
    @activities = @trip.activities
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :start_date, :user, :end_date)
  end
end
