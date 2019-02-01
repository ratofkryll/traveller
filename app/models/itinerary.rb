class Itinerary < ApplicationRecord
  belongs_to :trip
  has_many :itinerary_items, -> { order(:start_time) }, dependent: :delete_all

  attr_accessor :selected_item

  after_save :broadcast
  
  def broadcast
    TripChannel.broadcast_to(self.trip, { itinerary_id: self.id })
  end

end
