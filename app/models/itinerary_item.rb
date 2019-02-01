class ItineraryItem < ApplicationRecord
  belongs_to :itinerary
  belongs_to :attraction, optional: true

  after_create -> {
    ItineraryChannel.broadcast_to(self, {created_itinerary_item: self.id})
    ItineraryItemChannel.broadcast_to(self, {created: self.id})
  }
  after_update -> { ItineraryItemChannel.broadcast_to(self, {updated: self.id}) }
  after_destroy -> { ItineraryItemChannel.broadcast_to(self, {destroyed: self.id}) }


end
