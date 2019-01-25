class Invite < ApplicationRecord
  belongs_to :user_trip

  before_create :generate_token

  def generate_token
    self.token = Digest::SHA1.hexdigest([self.user_trip_id, Time.now, rand].join)
  end

end
