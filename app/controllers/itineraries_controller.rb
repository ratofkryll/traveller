class ItinerariesController < ApplicationController
  def new
    @itinerary = Itinerary.new
  end

  def create
    @itinerary = Itinerary.new(itinerary_params)
    respond_to do |format|
      if @itinerary.save
        format.html { redirect_to @itinerary, notice: 'Todo was successfully created.' }
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
    @itinerary.destroy!

    if @itinerary.destroy
      redirect_back fallback_location: trip_path(trip)
    else
      flash[:notice] = 'Woops. Looks like we couldn\'t delete your trip.'
    end

  end

  def show
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
