class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name, null: false
      t.string :country, null: false
      t.text :description, null: false
      t.string :language, null: false
      t.string :currency, null: false
      t.string :transit, null: false, default: ""
      t.string :emergency_phone, null: false
      t.string :time_zone, null: false
      t.string :tipping_custom, null: false, default: ""
      t.string :image, null: false

      t.timestamps
    end
  end
end
