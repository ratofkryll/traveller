class ItineraryItem < ApplicationRecord
  belongs_to :itinerary
  belongs_to :attraction, optional: true

  after_save :broadcast
  def broadcast
    ItineraryChannel.broadcast_to(self.itinerary, {itinerary_item_id: self.id })
  end

end
