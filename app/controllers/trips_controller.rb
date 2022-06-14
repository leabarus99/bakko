class TripsController < ApplicationController

  def index
    @trips = Trip.all
  end

  def show
    @trip = Trip.find(params[:id])
    @trips = Trip.all
  end

  def new
    @trip = Trip.new
    @trips = Trip.all
  end

  def create
    @trip = Trip.new(trip_params)
    @trips = Trip.all
    @trip.user = current_user
    if @trip.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  private

  def trip_params
    params.require(:trip).permit(:destination, :start_date, :user, :end_date, :budget)
  end
end
