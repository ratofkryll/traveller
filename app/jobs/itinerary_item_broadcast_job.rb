class ItineraryItemBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast 'trip_channel', itinerary_list: render_itinerary(data)
  end

  private
    def render_itinerary(data)
      TripController.renderer.render(partial: 'trips/itinerary_list', locals: { itinerary_list: data })
    end

end
