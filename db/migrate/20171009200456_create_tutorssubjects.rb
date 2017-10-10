class CreateTutorssubjects < ActiveRecord::Migration[5.1]
  def change
    create_table :tutorssubjects do |t|
      t.integer :tutor_id
      t.integer :subject_id
      t.timestamps
    end
  end
end
