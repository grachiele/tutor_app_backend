class Api::V1::SubjectsController < ApplicationController

  skip_before_action :authorized

  def index
    @subjects = Subject.all
    render json: @subjects
  end

end
