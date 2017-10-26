class Api::V1::StudentSessionsController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    @student = Student.find_by(email: params[:email])
    if @student && @student.authenticate(params[:password])
      token = encode_token( { student_id: @student.id })
      render json: { student: { first_name: @student.first_name, last_name: @student.last_name, username: @student.username, email: @student.email, location: @student.location, subjects: @student.subjects, tutors: @student.tutors.map { |tutor| {id: tutor.id, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, email: tutor.email, location: tutor.location }  }, not_selected_tutors: Tutor.all.select{ |tutor| !@student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, location: tutor.location, subject_names: tutor.subjects.map{|subject| subject.name.downcase} }} }, jwt_token: token }
    else
      render json: {
        error: "That account doesn't exist."
      }
    end
  end
end
