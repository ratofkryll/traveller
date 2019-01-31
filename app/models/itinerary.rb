class Itinerary < ApplicationRecord
  belongs_to :trip
  has_many :itinerary_items

end
