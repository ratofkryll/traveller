class TripChannel < ApplicationCable::Channel
  def subscribed
    stream_from "trip_channel"
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
