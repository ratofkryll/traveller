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

      # ActionCable.server.broadcast 'trip_channel',
      #                                 name: @itinerary_item.name

      flash[:notice] = 'Added to itinerary'
    else
      flash[:notice] = 'Woops something went wrong with adding your itinerary item.'
    end

    redirect_to trip_url(@itinerary_item.itinerary.trip_id)
  end

  def edit
  end

  def update
  end

  def show
    @itinerary_item = ItineraryItem.find params[:id]
  end

  def destroy
    @itinerary_item = ItineraryItem.find(params[:id])
    itinerary = @itinerary_item.itinerary
    @itinerary_item.destroy!
    redirect_to itinerary_path(itinerary)
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

  # def render_items(itinerary_item)
  #   render(partial: '/trips/itinerary_list', locals: { itinerary_item: itinerary_item})
  # end

  # def render_itinerary(itinerary)
  #   render(partial: '/trips/itinerary_list', locals: { itinerary: itinerary})
  # end

end
