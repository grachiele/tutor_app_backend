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
      params[:subjects].each do |x|
        Tutorssubject.create(tutor_id: @tutor.id, subject_id: x)
      end
      render json: @tutor
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

  private

  def tutor_params
    params.require(:tutor).permit(:id, :first_name, :last_name, :username, :email, :password, :location_id)
  end

end
