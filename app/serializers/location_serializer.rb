class LocationSerializer < ActiveModel::Serializer
  attributes :id, :city, :country, :state, :zipcode

  # has_many :students
  # has_many :tutors
end
