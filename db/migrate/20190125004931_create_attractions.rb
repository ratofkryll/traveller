class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :postcode
      t.string :website
      t.string :facebook
      t.string :instagram
      t.string :twitter
      t.text :description
      t.string :monday_hours
      t.string :tuesday_hours
      t.string :wednesday_hours
      t.string :thursday_hours
      t.string :friday_hours
      t.string :saturday_hours
      t.string :sunday_hours
      t.string :image
      t.string :categories
      t.string :google_place
      t.references :city, foreign_key: true
      t.boolean :public
      t.boolean :featured

      t.timestamps
    end
  end
end
