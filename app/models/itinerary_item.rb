class ItineraryItem < ApplicationRecord
  belongs_to :itinerary
  belongs_to :attraction, optional: true

  after_save :broadcast
  def broadcast
    TripChannel.broadcast_to(self.itinerary.trip, {})
  end

end
