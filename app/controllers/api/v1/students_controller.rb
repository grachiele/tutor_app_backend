class Api::V1::StudentsController < ApplicationController

  def index
    @students = Student.all
    render json: @students
  end

  def new

  end

  def create
    # byebug
    @student = Student.new(student_params)
    if @student.save
      render json: @student
    end
  end

  def show
    @student = Student.find(student_params[:id])
    render json: @student
  end

  def destroy
  end

  def update
  end

  private

  def student_params
    params.require(:student).permit(:first_name, :last_name, :username, :email, :password, :location_id)
  end

end
