class TripChannel < ApplicationCable::Channel
  def subscribed
    stream_from "trip_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def itinerary(data)
    ItineraryItem.create(data)
    # ActionCable.server.broadcast 'trip_channel', message: data['message']
  end

end
