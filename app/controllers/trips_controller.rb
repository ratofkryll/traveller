class TripsController < ApplicationController

  def new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)

    if @trip.save
      user_trip.create({user_id: current_user, trip_id: @trip.id, role: 'creator'})
      render trip_path(@trip.id)
    else
      notice `Woops. We've had some problems with saving your trip.`
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
      notice `Woops. Looks like we couldn't delete your trip.`
    end

  end

  def index
  end

  def show
    @trip = Trip.find params[:id]
    @itinerary = @trip.itineraries
  end

  private

  def trip_params
    params.require(:trip).permit(
      :name,
      :start_date,
      :end_date,
      :public,
      :featured
    )
  end

end
