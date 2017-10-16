class Student < ApplicationRecord
  
  validates :email, uniqueness: true
  has_secure_password

  belongs_to :location
  has_many :studentstutors
  has_many :tutors, through: :studentstutors
  has_many :studentssubjects
  has_many :subjects, through: :studentssubjects
end
