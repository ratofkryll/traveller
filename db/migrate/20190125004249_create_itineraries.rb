class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :name
      t.date :date
      t.string :notes
      t.boolean :public
      t.boolean :featured
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
