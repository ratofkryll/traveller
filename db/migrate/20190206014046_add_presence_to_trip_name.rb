class AddPresenceToTripName < ActiveRecord::Migration[5.2]
  def change
    change_column :trips, :name, :string, presence: true
  end
end
