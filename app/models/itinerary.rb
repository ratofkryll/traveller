class Itinerary < ApplicationRecord
  belongs_to :trip
  has_many :itinerary_items, dependent: :delete_all

  def items_by_start_time
    self.itinerary_items.order(:start_time)
  end

end
