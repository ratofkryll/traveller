class ItinerariesController < ApplicationController
  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to user_trips_path(current_user.id), notice: 'Itinerary was successfully created.' }
        format.json { render :show, status: :created, location: @itinerary }
      else
        format.html { render :new }
        format.json { render json: @itinerary.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @itinerary = Itinerary.find(params[:id])
  end

  def update
    @itinerary = Itinerary.find(params[:id])
    @itinerary.update(itinerary_params)
    redirect_to trip_url(@itinerary.trip_id)
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    trip = @itinerary.trip_id
    usertrip = UserTrip.where(trip_id: trip)

    usertrip.each do |indTrip|
      if indTrip.user_id === current_user.id
        @itinerary.destroy!
      else
        flash[:notice] = 'Woops. Looks like you do not own that itinerary.'
      end
    end

    if @itinerary.destroy
      redirect_to user_trips_path(current_user.id)
    else
      flash[:notice] = 'Woops. Looks like we couldn\'t delete your trip.'
    end

  end

  def show
    @itinerary_item = ItineraryItem.new
    @itinerary = Itinerary.find params[:id]
  end

  def details
    @itinerary_item = ItineraryItem.new
    @itinerary = Itinerary.find params[:id]
    @trip = @itinerary.trip
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(
      :name,
      :date,
      :notes,
      :trip_id,
      :public,
      :featured
    )
  end

end
