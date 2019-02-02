class RemoveUserTripFromInvites < ActiveRecord::Migration[5.2]
  def change
    remove_reference :invites, :user_trip, foreign_key: true
  end
end
