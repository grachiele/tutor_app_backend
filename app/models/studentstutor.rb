class Studentstutor < ApplicationRecord
  validates :student_id, uniqueness: { scope: :tutor_id }
  belongs_to :student
  belongs_to :tutor
end
