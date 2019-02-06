class Trip < ApplicationRecord
  has_many :user_trips, dependent: :delete_all
  has_many :users, through: :user_trips
  has_many :itineraries, dependent: :destroy
  has_many :invites, dependent: :delete_all

  validates_presence_of :start_date, :end_date, :name
  validate :end_after_start

  default_scope { order(start_date: :desc) }

  attr_accessor :selected_itinerary

  after_update -> { TripChannel.broadcast_to(self, {updated: self.id}) }
  after_destroy -> { TripChannel.broadcast_to(self, {destroyed: self.id}) }

  private
  def end_after_start
    return if end_date.blank? || start_date.blank?
    if end_date < start_date
      errors.add(:end_date, "must be after the start date") 
    end 
  end
end
