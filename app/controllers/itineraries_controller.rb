class ItinerariesController < ApplicationController
  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    @itinerary.trip_id = params[:trip_id]
    
    if @itinerary.save
      flash[:notice] = `Let's get planning!`
      render itinerary_path(@itinerary.id)
    else
      flash[:notice] = `Woops. We've had some problems saving your trip. Try again soon.`
    end

  end

  def edit
  end

  def update
  end

  def destroy
    @itinerary = Itinerary.find(params[itinerary_id])
    @itinerary.destroy!
  end

  def show
    @itinerary = Itinerary.find params[:itinerary_id]
    @itinerary_items = @itinerary.itinerary_items
  end

  private

  def itinerary_params
    params.require(:itinerary).permit(
      :name,
      :date,
      :notes,
      :public,
      :featured,
    )
  end

end
