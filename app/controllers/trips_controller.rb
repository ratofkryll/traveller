class TripsController < ApplicationController

  def new
    @trip = Trip.new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      @trip.users << current_user
      render trips_path(@trip.id)
    else
      render new_trip_path
      flash[:notice] = 'Woops. We\'ve had some problems with saving your trip.'
    end
  end

  def destroy
    tripId = params[:id]
    @trip = Trip.find(params[:id])
    @trip.destroy!

    if @trip.destroy
      @user_trip = UserTrip.find_by(trip_id: tripId)
      @user_trip.destroy!
    else
      flash[:notice] = 'Woops. Looks like we couldn\'t delete your trip.'
    end

  end

  def index
    @user = User.find params[:user_id]
    @trips = @user.trips
  end

  def show
    @trip = Trip.find params[:id]
    @itinerary = Itinerary.find_by(trip_id: @trip)
    @users = @trip.users
  end

  private

  def trip_params
    params.require(:trip).permit(
      :name,
      :start_date,
      :end_date,
      :public
    )
  end

end
