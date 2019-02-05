class CreateUserTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :user_trips do |t|
      t.references :user, foreign_key: true, null: false
      t.references :trip, foreign_key: true, null: false
      t.string :role, null: false, default: "creator"

      t.timestamps
    end
  end
end
