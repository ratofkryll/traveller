class ItineraryItem < ApplicationRecord
  belongs_to :itinerary
  belongs_to :attraction, optional: true

  # after_create_commit { ItineraryItemBroadcastJob.perform_later self }
end
