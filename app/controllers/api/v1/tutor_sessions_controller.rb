class Api::V1::TutorSessionsController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def create
    @tutor = Tutor.find_by(email: params[:email])
    if @tutor && @tutor.authenticate(params[:password])
      render json: {
        tutor: { first_name: @tutor.first_name, last_name: @tutor.last_name, username: @tutor.username, email: @tutor.email, location: @tutor.location, subjects: @tutor.subjects, tutors: @tutor.students },
        jwt_token: encode_token({ tutor_id: @tutor.id })
      }
    else
      render json: {
        error: "That account doesn't exist."
      }
    end
  end
end
