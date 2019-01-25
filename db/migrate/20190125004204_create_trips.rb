class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :name
      t.date :start_date
      t.date :end_date
      t.boolean :public
      t.boolean :featured

      t.timestamps
    end
  end
end
