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
  end

  def update
  end

  def destroy
    @itinerary = Itinerary.find(params[:id])
    @itinerary.destroy!

    if @itinerary.destroy
      redirect_to user_trips_path(current_user.id)
    else
      flash[:notice] = 'Woops. Looks like we couldn\'t delete your trip.'
    end

  end

  def show
    @itinerary = Itinerary.find params[:id]
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
