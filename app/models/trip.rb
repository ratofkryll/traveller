class Trip < ApplicationRecord
  has_many :user_trips, dependent: :delete_all
  has_many :users, through: :user_trips
  has_many :itineraries, dependent: :destroy
  has_many :invites, dependent: :delete_all

  validates_presence_of :start_date, :end_date

  default_scope { order(start_date: :desc) }

  attr_accessor :selected_itinerary

  after_update -> { TripChannel.broadcast_to(self, {updated: self.id}) }
  after_destroy -> { TripChannel.broadcast_to(self, {destroyed: self.id}) }

end
