class TripsController < ApplicationController
  before_action :authenticate_user!
  def new
    @trip = Trip.new
  end

  def edit
  end

  def create
    @trip = Trip.new(trip_params)
    @trip.users << current_user
    if @trip.save
      redirect_to trip_url(@trip.id)
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
      redirect_back fallback_location: user_trips_path(current_user.id)
    else
      flash[:notice] = 'Woops. Looks like we couldn\'t delete your trip.'
    end

  end

  def index
    @user = User.find params[:user_id]
    @trips = @user.trips
    @trip_new = Trip.new
  end


  def show
    @trip = Trip.includes(itineraries: :itinerary_items).find params[:id]
    @selected_itinerary = @trip.itineraries.find_by(id: params[:selected_itinerary_id])
    @selected_itinerary ||= @trip.itineraries.first
    @invite = Invite.new
    respond_to do |format|
      format.cable { render layout: false }
    end

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
