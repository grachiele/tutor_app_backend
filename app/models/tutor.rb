class Tutor < ApplicationRecord
  has_secure_password

  belongs_to :location
  has_many :studentstutors
  has_many :students, through: :studentstutors
  has_many :tutorssubjects
  has_many :subjects, through: :tutorssubjects
end
