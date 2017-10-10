class Studentstutor < ApplicationRecord
  belongs_to :student
  belongs_to :tutors
end
