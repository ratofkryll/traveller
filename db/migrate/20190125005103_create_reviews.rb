class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.references :user, foreign_key: true, null: false
      t.references :attraction, foreign_key: true, null: false
      t.text :review, null: false
      t.integer :rating, null: false

      t.timestamps
    end
  end
end
