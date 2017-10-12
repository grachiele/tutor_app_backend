class CreateTutors < ActiveRecord::Migration[5.1]
  def change
    create_table :tutors do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :location_id
      t.timestamps
    end
  end
end
