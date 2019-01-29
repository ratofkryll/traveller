class ItineraryItemsController < ApplicationController
  def create
    @itinerary_item = ItineraryItem.new(itinerary_params)
    @itinerary_item.itinerary_id = params[:itinerary_id]

    if @itinerary_item.save
      flash[:notice] = 'Added to itinerary'
    else
      flash[:notice] = 'Woops something went wrong with adding your itinerary item.'
    end

    redirect_to itinerary_path(@itinerary_item.trip)

  end

  def edit
  end

  def update
  end

  def show
    @itinerary_items = ItineraryItem.find_by(itinerary_id: params[:id])
  end

  def destroy
    @itinerary_item = ItineraryItem.find(params[:id])
    itinerary = @itinerary_item.itinerary
    @itinerary_item.destroy!
    redirect_to itinerary_path(itinerary)
  end

  private
  def itinerary_params
    params.require(:itinerary_items).permit(
      :name,
      :notes,
      :start_time,
      :end_time
    )
  end

end
