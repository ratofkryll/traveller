class Trip < ApplicationRecord
  has_many :user_trips, dependent: :delete_all
  has_many :users, through: :user_trips
  has_many :itineraries, dependent: :delete_all

  attr_accessor :selected_itinerary

  after_create -> { TripChannel.broadcast_to(self, {created: self.id}) }
  after_update -> { TripChannel.broadcast_to(self, {updated: self.id}) }
  after_destroy -> { TripChannel.broadcast_to(self, {destroyed: self.id}) }

end
