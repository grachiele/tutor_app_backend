class SubjectSerializer < ActiveModel::Serializer
  attributes :id, :name

  # has_many :studentssubjects
  # has_many :tutorssubjects
  # has_many :students, through: :studentssubjects
  # has_many :tutors, through: :tutorssubjects
end
