class RenameAttractionsCityColumn < ActiveRecord::Migration[5.2]
  def change
    change_table :attractions do |t|
      t.rename :city, :address_city
      t.rename :postcode, :address_postcode
    end
  end
end
