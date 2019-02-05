class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.boolean :public, null: false
      t.boolean :featured, null: false

      t.timestamps
    end
  end
end
