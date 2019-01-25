class CreateCities < ActiveRecord::Migration[5.2]
  def change
    create_table :cities do |t|
      t.string :name
      t.string :country
      t.text :description
      t.string :language
      t.string :currency
      t.string :transit
      t.string :emergency_phone
      t.string :time_zone
      t.string :tipping_custom
      t.string :image

      t.timestamps
    end
  end
end
