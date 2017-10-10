class Tutor < ApplicationRecord
  belongs_to :location
  has_many :tutorssubjects
  has_many :subjects, through: :tutorsssubjects
end
