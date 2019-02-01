class Trip < ApplicationRecord
  has_many :user_trips, dependent: :delete_all
  has_many :users, through: :user_trips
  has_many :itineraries, dependent: :destroy

  validates_presence_of :start_date, :end_date

  attr_accessor :selected_itinerary

  after_create -> {
    users.each{ |u| UserChannel.broadcast_to(u, {created_trip: self.id}) }
    TripChannel.broadcast_to(self, {created: self.id})
  }

  after_update -> { TripChannel.broadcast_to(self, {updated: self.id}) }
  after_destroy -> { TripChannel.broadcast_to(self, {destroyed: self.id}) }

end
