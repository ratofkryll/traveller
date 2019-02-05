class AddColumnsToInvites < ActiveRecord::Migration[5.2]
  def change
    add_reference :invites, :trip, foreign_key: true, null: false
    add_column :invites, :sender, :integer, null: false
  end
end
