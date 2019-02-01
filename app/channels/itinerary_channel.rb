class ItineraryChannel < ApplicationCable::Channel
  def subscribed
    @itinerary = Itinerary.find(params[:id])
    stream_for @itinerary
    # stream_from "some_channel"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
