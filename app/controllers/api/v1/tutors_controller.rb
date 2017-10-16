class Api::V1::TutorsController < ApplicationController

  skip_before_action :authorized, only: [:create]

  def index
    @tutors = Tutor.all
    render json: @tutors
  end

  def new

  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      params[:subjects].each do |x|
        Tutorssubject.create(tutor_id: @tutor.id, subject_id: x)
      end
      token = encode_token({ tutor_id: @tutor.id })
      render json: { tutor: { first_name: @tutor.first_name, last_name: @tutor.last_name, username: @tutor.username, email: @tutor.email, location: @tutor.location, subjects: @tutor.subjects, tutors: @tutor.students }, jwt_token: token }
    else
      render json: @tutor.errors
    end
  end

  def show
    @tutor = Tutor.find(params[:id])
    render json: @tutor
  end

  def destroy
  end

  def update
  end

  def welcome
    if logged_in?
      render json: @tutor
    else
      render json: {message: "Please log in"}
    end
  end

  private

  def tutor_params
    params.require(:tutor).permit(:id, :first_name, :last_name, :username, :email, :password, :location_id)
  end

end
