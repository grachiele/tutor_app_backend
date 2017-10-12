class Api::V1::TutorsController < ApplicationController

  def index
    @tutors = Tutor.all
    render json: @tutors
  end

  def new

  end

  def create
    @tutor = Tutor.new(tutor_params)
    if @tutor.save
      render json: { tutor: @tutor }
    end
  end

  def show
    @tutor = Tutor.find(tutor_params[:id])
    render json: @tutor
  end

  def destroy
  end

  def update
  end

  private

  def tutor_params
    params.permit(:id, :first_name, :last_name, :username, :email, :location_id)

  end
end
