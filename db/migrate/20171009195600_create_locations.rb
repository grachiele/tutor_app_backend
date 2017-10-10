class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :city
      t.string :country
      t.string :state
      t.integer :zipcode
      t.timestamps
    end
  end
end
