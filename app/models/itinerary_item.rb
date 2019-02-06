class ItineraryItem < ApplicationRecord
  belongs_to :itinerary
  belongs_to :attraction, optional: true

  validates_presence_of :start_time, :end_time
  validate :end_after_start

  after_create -> {
    ItineraryChannel.broadcast_to(self.itinerary, {created_itinerary_item: self.id})
    ItineraryItemChannel.broadcast_to(self, {created: self.id})
  }
  after_update -> { ItineraryItemChannel.broadcast_to(self, {updated: self.id}) }
  after_destroy -> { ItineraryItemChannel.broadcast_to(self, {destroyed: self.id}) }

  private
  def end_after_start
    return if end_time.blank? || start_time.blank?
    if end_time < start_time
      errors.add(:end_time, "must be after the start date") 
    end 
  end

end
