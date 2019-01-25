class CreateInvites < ActiveRecord::Migration[5.2]
  def change
    create_table :invites do |t|
      t.references :user_trip, foreign_key: true
      t.string :email
      t.text :message
      t.string :token

      t.timestamps
    end
  end
end
