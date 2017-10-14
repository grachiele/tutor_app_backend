class Api::V1::StudentsController < ApplicationController

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
      render json: @student
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

  private

  def student_params
    params.require(:student).permit(:id, :first_name, :last_name, :username, :email, :password, :location_id)
  end

end
