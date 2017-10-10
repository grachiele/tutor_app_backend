class Location < ApplicationRecord
  has_many :students
  has_many :tutors
end
