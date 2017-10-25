class StudentSerializer < ActiveModel::Serializer
  attributes :id, :first_name, :last_name, :username, :email

  belongs_to :location
  has_many :tutors
  has_many :subjects
end
