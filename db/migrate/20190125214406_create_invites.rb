class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.references :user_trip, foreign_key: true, null: false
      t.integer :recipient, null: false
      t.string :email, null: false
      t.text :message, null: false
      t.string :token, null: false

      t.timestamps
    end
  end
end
