# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

locations = Location.create(
  [
    {city: "Bronx", country: "US", state: "NY", zipcode: 10465},
    {city: "Brooklyn", country: "US", state: "NY", zipcode: 11512},
    {city: "New York", country: "US", state: "NY", zipcode: 10021}
  ]
)

# students = Student.create(
#   [
#     {first_name: "Gianpaul", last_name: "Rachiele", username: "gianpaul817", email: "gianpaul817@gmail.com", location_id: 1},
#     {first_name: "James", last_name: "Miele", username: "james1", email: "james@email.com", location_id: 1},
#     {first_name: "Roman", last_name: "Mullady", username: "roman1", email: "roman@email.com", location_id: 3}
#   ]
# )

# tutors = Tutor.create(
#   [
#     {first_name: "Gabi", last_name: "D", username: "gabid", email: "gabi@email.com", location_id: 1},
#     {first_name: "Tim", last_name: "Freeman", username: "timfreeman", email: "tim@email.com", location_id: 1},
#     {first_name: "Joe", last_name: "Cha", username: "joecha", email: "joe@email.com", location_id: 3}
#   ]
# )

subjects = Subject.create(
  [
    {name: "Math"},
    {name: "Physics"},
    {name: "Biology"},
    {name: "Spanish"},
    {name: "Italian"},
    {name: "Earth Science"},
    {name: "Chemisty"},
    {name: "Trigonometry"},
    {name: "Algebra"},
    {name: "Pre Calc"},
    {name: "Statistics"},
    {name: "Calculus"},
    {name: "English"},
    {name: "Creative Writing"},
    {name: "Philosophy"},
    {name: "Economics"},
    {name: "Finance"},
    {name: "Marketing"},
    {name: "Sales"},
    {name: "Sociology"},
    {name: "Socioeconomics"},
    {name: "Organic Chemistry"}
  ]
)


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
