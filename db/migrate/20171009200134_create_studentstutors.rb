class CreateStudentstutors < ActiveRecord::Migration[5.1]
  def change
    create_table :studentstutors do |t|
      t.integer :tutor_id
      t.integer :student_id
      t.timestamps
    end
  end
end
