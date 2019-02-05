class UserTrip < ApplicationRecord
  belongs_to :user, touch: true
  belongs_to :trip, touch: true

  after_create -> {
    UserChannel.broadcast_to(self.user, {created_trip: self.trip_id})
    TripChannel.broadcast_to(self.trip, {created: self.trip_id})
  }


end
