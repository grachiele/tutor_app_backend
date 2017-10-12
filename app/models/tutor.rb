class Tutor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_secure_password
  
  belongs_to :location
  has_many :studentstutors
  has_many :students, through: :studentstutors
  has_many :tutorssubjects
  has_many :subjects, through: :tutorssubjects
end
