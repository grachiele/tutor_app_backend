class Student < ApplicationRecord
  belongs_to :location
  has_many :studentssubjects
  has_many :subjects, through: :studentssubjects
end
