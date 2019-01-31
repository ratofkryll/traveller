class Itinerary < ApplicationRecord
  belongs_to :trip
  has_many :itinerary_items, dependent: :delete_all
end
