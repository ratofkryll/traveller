class ItineraryItemsController < ApplicationController
  
  def new
    if params[:attraction_id]
      @attraction = Attraction.find params[:attraction_id]
    end
    @itinerary_item = ItineraryItem.new
  end
  
  def create
    @itinerary_item = ItineraryItem.new(itinerary_params)

    if @itinerary_item.save
      flash[:notice] = 'Added to itinerary'
    else
      flash[:notice] = 'Woops something went wrong with adding your itinerary item.'
    end

    redirect_to trip_url(@itinerary_item.itinerary.trip_id)
  end

  def edit
    @itinerary_item = ItineraryItem.find(params[:id])
    @itinerary = ItineraryItem.find_by(itinerary_id: @itinerary_item.itinerary_id)
  end

  def update
    @itinerary_item = ItineraryItem.find(params[:id])
    @itinerary_item.update(itinerary_params)
    redirect_to trip_url(@itinerary_item.itinerary.trip_id)
  end

  def show
    @itinerary_item = ItineraryItem.find_by(id: params[:id])
    @itinerary = ItineraryItem.find_by(itinerary_id: @itinerary_item.itinerary_id)
  end

  def destroy
    @itinerary_item = ItineraryItem.find(params[:id])
    itinerary = @itinerary_item.itinerary
    trip = Trip.find_by_id(itinerary.trip_id)
    @itinerary_item.destroy!
    redirect_back fallback_location: trip_path(trip)
  end

  private
  def itinerary_params
    params.require(:itinerary_item).permit(
      :name,
      :notes,
      :start_time,
      :end_time,
      :itinerary_id,
      :attraction_id
    )
  end

end
