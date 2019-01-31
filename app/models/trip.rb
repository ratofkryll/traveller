class Trip < ApplicationRecord
  has_many :user_trips, dependent: :delete_all
  has_many :users, through: :user_trips
  has_many :itineraries, dependent: :delete_all
end
