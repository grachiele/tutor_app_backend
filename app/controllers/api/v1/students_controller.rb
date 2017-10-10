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
      render json: { student: @student}
    end
  end

  def show
  end

  def destroy
  end

  def update
  end

  private

  def student_params
    params.permit(:first_name, :last_name, :username, :email, :location_id)
  end

end
