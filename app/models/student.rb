class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  belongs_to :location
  has_many :studentstutors
  has_many :tutors, through: :studentstutors
  has_many :studentssubjects
  has_many :subjects, through: :studentssubjects
end
