class AddColumnsToInvites < ActiveRecord::Migration[5.2]
  def change
    add_reference :invites, :trip, foreign_key: true
    add_column :invites, :sender, :integer
  end
end
