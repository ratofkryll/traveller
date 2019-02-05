class CreateItineraryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :itinerary_items do |t|
      t.references :itinerary, foreign_key: true, null: false
      t.references :attraction, foreign_key: true
      t.string :name, null: false, default: ""
      t.text :notes, null: false, default: ""
      t.time :start_time, null: false
      t.time :end_time, null: false

      t.timestamps
    end
  end
end
