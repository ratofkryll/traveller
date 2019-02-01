class Itinerary < ApplicationRecord
  belongs_to :trip
  has_many :itinerary_items, -> { order(:start_time) }, dependent: :delete_all

  attr_accessor :selected_item


    after_create -> {
      TripChannel.broadcast_to(self, {created_itinerary: self.id})
      ItineraryChannel.broadcast_to(self, {created: self.id})
    }
    after_update -> { ItineraryChannel.broadcast_to(self, {updated: self.id}) }
    after_destroy -> { ItineraryChannel.broadcast_to(self, {destroyed: self.id}) }


end
