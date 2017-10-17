class Api::V1::StudentsController < ApplicationController

  skip_before_action :authorized, only: [:index, :create]

  def index
    @students = Student.all
    render json: @students
  end

  def new

  end

  def create
    @student = Student.new(student_params)
    if @student.save
      params[:subjects].each do |x|
        Studentssubject.create(student_id: @student.id, subject_id: x)
      end
      token = encode_token( { student_id: @student.id })
      render json: { student: { first_name: @student.first_name, last_name: @student.last_name, username: @student.username, email: @student.email, location: @student.location, subjects: @student.subjects, tutors: @student.tutors }, jwt_token: token }
    else
      render json: @student.errors
    end
  end

  def show
    @student = Student.find(params[:id])
    render json: @student
  end

  def destroy
  end

  def update
  end

  def welcome
    if logged_in?
      render json: @student
    else
      render json: {message: "Please log in"}
    end
  end

  private

  def student_params
    params.require(:student).permit(:id, :first_name, :last_name, :username, :email, :password, :location_id)
  end

end
