class Api::V1::StudentSessionsController < ApplicationController

  def index

  end

  def new

  end

  def create
    @student = Student.find_by(email: params[:email])
    if @student && @student.authenticate(params[:password])
      render json: @student
    else
      render json: @student.errors
    end
  end

  def show

  end

  def destroy
  end

  def update

  end

end
