class CreateItineraryItems < ActiveRecord::Migration[5.2]
  def change
    create_table :itinerary_items do |t|
      t.references :itinerary, foreign_key: true
      t.references :attraction, foreign_key: true
      t.string :name
      t.text :notes
      t.time :start_time
      t.time :end_time

      t.timestamps
    end
  end
end
