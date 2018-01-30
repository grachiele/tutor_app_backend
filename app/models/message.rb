class Message < ActiveRecord::Base
  belongs_to :conversation
  belongs_to :tutor
  belongs_to :student
  validates_presence_of :body, :conversation_id, :student_id, :tutor_id

    def message_time
      created_at.strftime(“%m/%d/%y at %l:%M %p”)
    end
end
