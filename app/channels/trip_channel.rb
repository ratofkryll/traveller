class TripChannel < ApplicationCable::Channel
  def subscribed
    # itinerary = Itinerary.find(trips.itinerary)
    # stream_for itinerary
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def itinerary(data)
  #   ItineraryItem.create(data)
  #   ActionCable.server.broadcast 'trip_channel', itinerary_item: data[params]
  # end

end
