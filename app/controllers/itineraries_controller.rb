class ItinerariesController < ApplicationController
  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)

    if @itinerary.save
      flash[:notice] = `Let's get planning!`
      redirect_to trip_url(@itinerary.trip_id)
      puts "It's been saved."
    else
      flash[:notice] = `Woops. We've had some problems saving your trip. Try again soon.`
      puts "It hasn't been saved."
    end

  end

  def edit
  end

  def update
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy!

    if @itinerary.destroy
      redirect_back fallback_location: user_trips_path(current_user.id)
    else
      flash[:notice] = 'Woops. Looks like we couldn\'t delete your trip.'
    end

  end

  def show
    # @itinerary = Itinerary.find params[:itinerary_id]
    # @itinerary_items = @itinerary.itinerary_items
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
