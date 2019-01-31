class ItineraryItemBroadcastJob < ApplicationJob
  queue_as :default

  def perform(data)
    ActionCable.server.broadcast 'trip_channel', data: render_itinerary(data)
  end

  private
    def render_itinerary(data)
      ApplicationController.renderer.render(partial: 'trips/itinerary-list', locals: { message: message })
    end

end
