class Api::V1::TutorSessionsController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    @tutor = Tutor.find_by(email: params[:email])
    if @tutor && @tutor.authenticate(params[:password])
      render json: {
        tutor: { first_name: @tutor.first_name, last_name: @tutor.last_name, username: @tutor.username, email: @tutor.email, location: @tutor.location, subjects: @tutor.subjects, students: @tutor.students.map { |student| { id: student.id, first_name: student.first_name, last_name: student.last_name, username: student.username, email: student.email, location: student.location, subjects: student.subjects, subject_names: student.subjects.map{|subject| subject.name.downcase}, tutors: student.tutors, not_selected_tutors: Tutor.all.select{ |tutor| !student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase}}}}}, not_selected_students: Student.all.select{ |student| !@tutor.students.include?(student)}.map{ |student| {id: student.id, email: student.email, first_name: student.first_name, last_name: student.last_name, subjects: student.subjects, subject_names: student.subjects.map{|subject| subject.name.downcase} }} },
        jwt_token: encode_token({ tutor_id: @tutor.id })
      }
    else
      render json: {
        error: "That account doesn't exist."
      }
    end
  end
end
