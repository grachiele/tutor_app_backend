class CreateConversations < ActiveRecord::Migration[5.1]
  def change
    create_table :conversations do |t|
      t.integer :sender_id
      i.integer :recipient_id

      t.timestamps
    end
  end
end
