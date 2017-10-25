class Api::V1::StudentSessionsController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    @student = Student.find_by(email: params[:email])
    if @student && @student.authenticate(params[:password])
      render json: {
        student: { first_name: @student.first_name, last_name: @student.last_name, username: @student.username, email: @student.email, location: @student.location, subjects: @student.subjects, tutors: @student.tutors.map { |tutor| { id: tutor.id, first_name: tutor.first_name, last_name: tutor.last_name, username: tutor.username, email: tutor.email, location: tutor.location, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase}, students: tutor.students, not_selected_students: Student.all.select{ |student| !tutor.students.include?(student)}.map{ |student| {id: student.id, email: student.email, first_name: student.first_name, last_name: student.last_name, subjects: student.subjects, subject_names: student.subjects.map{|subject| subject.name.downcase}}}}},
        not_selected_tutors: Tutor.all.select{ |tutor| !@student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase} }} },
        jwt_token: encode_token({ student_id: @student.id })
      }
    else
      render json: {
        error: "That account doesn't exist."
      }
    end
  end
end
