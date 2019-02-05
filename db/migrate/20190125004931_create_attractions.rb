class CreateAttractions < ActiveRecord::Migration[5.2]
  def change
    create_table :attractions do |t|
      t.string :name, null: false
      t.string :address, null: false, default: ""
      t.string :city, null: false
      t.string :postcode, null: false, default: ""
      t.string :website, null: false, default: ""
      t.string :facebook, null: false, default: ""
      t.string :instagram, null: false, default: ""
      t.string :twitter, null: false, default: ""
      t.text :description, null: false
      t.string :monday_hours, null: false, default: ""
      t.string :tuesday_hours, null: false, default: ""
      t.string :wednesday_hours, null: false, default: ""
      t.string :thursday_hours, null: false, default: ""
      t.string :friday_hours, null: false, default: ""
      t.string :saturday_hours, null: false, default: ""
      t.string :sunday_hours, null: false, default: ""
      t.string :image, null: false
      t.string :categories, null: false, default: ""
      t.string :google_place, null: false, default: ""
      t.references :city, foreign_key: true, null: false
      t.boolean :public, null: false, default: false
      t.boolean :featured, null: false, default: false

      t.timestamps
    end
  end
end
