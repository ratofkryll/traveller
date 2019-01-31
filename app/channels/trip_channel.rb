class TripChannel < ApplicationCable::Channel
  def subscribed
    stream_from "trip_channel"
    # stream_from "trip_channel_#{trip.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  # def itinerary(data)
  #   ItineraryItem.create(data)
  #   ActionCable.server.broadcast 'trip_channel', itinerary_item: data[params]
  # end

end
