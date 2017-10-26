class Api::V1::TutorsController < ApplicationController

  skip_before_action :authorized, only: [:index, :create, :me]

  def index
    @tutors = Tutor.all.includes([:location, :students, :subjects])
    @modified = @tutors.map { |tutor| { id: tutor.id, first_name: tutor.first_name, last_name: tutor.last_name, username: tutor.username, email: tutor.email, location: tutor.location, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase}, students: tutor.students, not_selected_students: Student.all.select{ |student| !tutor.students.include?(student)}.map{ |student| {id: student.id, email: student.email, first_name: student.first_name, location: student.location, last_name: student.last_name, subjects: student.subjects, subject_names: student.subjects.map{|subject| subject.name.downcase}}}}}
    render json: @modified
  end

  def new

  end

  def create
    @location = Location.find_by(zipcode: tutor_params[:location_id])
    @tutor = Tutor.new(first_name: tutor_params[:first_name], last_name: tutor_params[:last_name], username: tutor_params[:username], email: tutor_params[:email], password: tutor_params[:password], location_id: @location.id)
    if @tutor.save
      params[:subjects].each do |x|
        Tutorssubject.create(tutor_id: @tutor.id, subject_id: x)
      end
      token = encode_token({ tutor_id: @tutor.id })
      render json: { tutor: { first_name: @tutor.first_name, last_name: @tutor.last_name, username: @tutor.username, email: @tutor.email, location: @tutor.location, subjects: @tutor.subjects, students: @tutor.students.map { |student| {id: student.id, first_name: student.first_name, last_name: student.last_name, subjects: student.subjects, email: student.email, location: student.location }  }, not_selected_students: Student.all.select{ |student| !@tutor.students.include?(student)}.map{ |student| {id: student.id, email: student.email, first_name: student.first_name, last_name: student.last_name, location: student.location, subjects: student.subjects, subject_names: student.subjects.map{|subject| subject.name.downcase} }} }, jwt_token: token }
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

  def remove_association_tutor
    @tutor = current_tutor
    @tutor.students.delete(params[:student_id])

    render json: { first_name: @tutor.first_name, last_name: @tutor.last_name, username: @tutor.username, email: @tutor.email, location: @tutor.location, subjects: @tutor.subjects, students: @tutor.students.map { |student| {id: student.id, first_name: student.first_name, last_name: student.last_name, subjects: student.subjects, email: student.email, location: student.location }  }, not_selected_students: Student.all.select{ |student| !@tutor.students.include?(student)}.map{ |student| {id: student.id, email: student.email, first_name: student.first_name, last_name: student.last_name, location: student.location, subjects: student.subjects, subject_names: student.subjects.map{|subject| subject.name.downcase}}}}
  end

  def welcome
    if logged_in_tutor?
      render json: @tutor
    else
      render json: {message: "Please log in"}
    end
  end

  def me
    @tutor = current_tutor

    render json: { first_name: @tutor.first_name, last_name: @tutor.last_name, username: @tutor.username, email: @tutor.email, location: @tutor.location, subjects: @tutor.subjects, students: @tutor.students.map { |student| {id: student.id, first_name: student.first_name, last_name: student.last_name, subjects: student.subjects, email: student.email, location: student.location }  }, not_selected_students: Student.all.select{ |student| !@tutor.students.include?(student)}.map{ |student| {id: student.id, email: student.email, location: student.location, first_name: student.first_name, last_name: student.last_name, subjects: student.subjects, subject_names: student.subjects.map{|subject| subject.name.downcase} }}}
  end

  def tutor_student
    @tutor = current_tutor
    @student = Student.find_by({id: params[:student_id]})
    Studentstutor.create({student_id: @student.id, tutor_id: @tutor.id})

    render json: { first_name: @tutor.first_name, last_name: @tutor.last_name, username: @tutor.username, email: @tutor.email, location: @tutor.location, subjects: @tutor.subjects, students: @tutor.students.map { |student| {id: student.id, first_name: student.first_name, last_name: student.last_name, subjects: student.subjects, email: student.email, location: student.location }  }, not_selected_students: Student.all.select{ |student| !@tutor.students.include?(student)}.map{ |student| {id: student.id, email: student.email, first_name: student.first_name, last_name: student.last_name, subjects: student.subjects, location: student.location, subject_names: student.subjects.map{|subject| subject.name.downcase} }}}
  end

  def tutors_subject
    @tutor = current_tutor
    @tutor.subject_ids = params[:subject_ids]

    render json: { first_name: @tutor.first_name, last_name: @tutor.last_name, username: @tutor.username, email: @tutor.email, location: @tutor.location, subjects: @tutor.subjects, students: @tutor.students.map { |student| {id: student.id, first_name: student.first_name, last_name: student.last_name, subjects: student.subjects, email: student.email, location: student.location }  }, not_selected_students: Student.all.select{ |student| !@tutor.students.include?(student)}.map{ |student| {id: student.id, email: student.email, location: student.location, first_name: student.first_name, last_name: student.last_name, subjects: student.subjects, subject_names: student.subjects.map{|subject| subject.name.downcase} }}}
  end

  private

  def tutor_params
    params.require(:tutor).permit(:id, :first_name, :last_name, :username, :email, :password, :location_id)
  end

end
