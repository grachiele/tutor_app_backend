class Api::V1::TutorsController < ApplicationController

  def index
    @tutors = Tutor.all
    render json: @tutors
  end

  def new
  end

  def create
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
