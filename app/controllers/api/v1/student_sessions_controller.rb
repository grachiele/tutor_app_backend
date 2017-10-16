class Api::V1::StudentSessionsController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    @student = Student.find_by(email: params[:email])
    if @student && @student.authenticate(params[:password])
      render json: {
        student: { first_name: @student.first_name, last_name: @student.last_name, username: @student.username, email: @student.email, location: @student.location, subjects: @student.subjects, tutors: @student.tutors },
        jwt_token: encode_token({ student_id: @student.id })
      }
    else
      render json: {
        error: "That account doesn't exist."
      }
    end
  end
end
