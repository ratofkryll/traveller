class TripChannel < ApplicationCable::Channel
  def subscribed
    @trip = Trip.find(params[:id])
    stream_for @trip
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    itinerary_item = ItineraryItem.create(data)
    itinerary = Itinerary.find_by_id(itinerary_item.itinerary_id)
    TripChannel.broadcast_to('trip_channel', itinerary)
  end

end
