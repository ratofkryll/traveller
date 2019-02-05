class CreateItineraries < ActiveRecord::Migration[5.2]
  def change
    create_table :itineraries do |t|
      t.string :name, null: false
      t.date :date, null: false
      t.string :notes, null: false, default: ""
      t.boolean :public, null: false, default: false
      t.boolean :featured, null: false, default: false
      t.references :trip, foreign_key: true, null: false

      t.timestamps
    end
  end
end
