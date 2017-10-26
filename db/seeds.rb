# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# location_path = "/Users/gianpaulrachiele/Desktop/us_postal_codes.csv"
#
# location_file = File.open(location_path, "r")
#
# location_file.each_line { |line|
#   fields= line.split(',')
#
#   Location.create({city: fields[1], country: "US", state: fields[3], zipcode: fields[0]})
# }
#
#
# subjects = Subject.create(
#   [
#     {name: "Math"},
#     {name: "Physics"},
#     {name: "Biology"},
#     {name: "Spanish"},
#     {name: "Italian"},
#     {name: "Earth Science"},
#     {name: "Chemisty"},
#     {name: "Trigonometry"},
#     {name: "Algebra"},
#     {name: "Pre Calc"},
#     {name: "Statistics"},
#     {name: "Calculus"},
#     {name: "English"},
#     {name: "Creative Writing"},
#     {name: "Philosophy"},
#     {name: "Economics"},
#     {name: "Finance"},
#     {name: "Marketing"},
#     {name: "Sales"},
#     {name: "Sociology"},
#     {name: "Socioeconomics"},
#     {name: "Organic Chemistry"}
#   ]
# )
#
# subject_path = "/Users/gianpaulrachiele/Desktop/majors-list.csv"
#
# subject_file = File.open(subject_path, "r")
#
# subject_file.each_line { |line|
#   fields= line.split(',')
#
#   Subject.create({name: fields[1].titleize})
# }

# studentstutors = Studentstutor.create([
#   {tutor_id: 1, student_id: 1},
#   {tutor_id: 1 , student_id: 2},
#   {tutor_id: 2, student_id: 3},
#   {tutor_id: 3, student_id: 2}
#   ])
#
#   tutorssubjects = Tutorssubject.create([
#     {tutor_id: 1, subject_id: 1},
#     {tutor_id: 2, subject_id: 1},
#     {tutor_id: 3, subject_id: 1},
#     {tutor_id: 3, subject_id: 2},
#     {tutor_id: 3, subject_id: 3},
#     {tutor_id: 1, subject_id: 4},
#     {tutor_id: 2, subject_id: 4}
#     ])

30.times do
  Student.create({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "#{Faker::Crypto.md5}", location_id: "#{Faker::Address.zip}"})
  Tutor.create({first_name: Faker::Name.first_name, last_name: Faker::Name.last_name, email: Faker::Internet.email, password: "#{Faker::Crypto.md5}", location_id: "#{Faker::Address.zip}"})
end

60.times do
  Tutorssubject.create({tutor_id: Faker::Number.between(1, Tutor.all.size), subject_id: Faker::Number.between(1, Subject.all.size)})
  Studentssubject.create({student_id: Faker::Number.between(1, Student.all.size), subject_id: Faker::Number.between(1, Subject.all.size)})
end
