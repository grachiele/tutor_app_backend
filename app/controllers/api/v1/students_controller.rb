class Api::V1::StudentsController < ApplicationController

  skip_before_action :authorized, only: [:index, :create, :me]

  def index
    @students = Student.all
    @modified = @students.map { |student| { id: student.id, first_name: student.first_name, last_name: student.last_name, username: student.username, email: student.email, location: student.location, subjects: student.subjects, subject_names: student.subjects.map{|subject| subject.name.downcase}, tutors: student.tutors, not_selected_tutors: Tutor.all.select{ |tutor| !student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase}}}}}
    render json: @modified
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
      render json: { student: { first_name: @student.first_name, last_name: @student.last_name, username: @student.username, email: @student.email, location: @student.location, subjects: @student.subjects, tutors: @student.tutors.map { |tutor| {id: tutor.id, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, email: tutor.email }  }, not_selected_tutors: Tutor.all.select{ |tutor| !@student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase} }}, not_selected_tutors: Tutor.all.select{ |tutor| !@student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase} }} }, jwt_token: token }
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

  def remove_association_student
    @student = current_student
    @student.tutors.delete(params[:tutor_id])

    render json: { first_name: @student.first_name, last_name: @student.last_name, username: @student.username, email: @student.email, location: @student.location, subjects: @student.subjects, tutors: @student.tutors.map { |tutor| {id: tutor.id, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, email: tutor.email }  }, not_selected_tutors: Tutor.all.select { |tutor| !@student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase} }},
    not_selected_tutors: Tutor.all.select{ |tutor| !@student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase} }} }
  end

  def welcome
    if logged_in_student?
      render json: @student
    else
      render json: {message: "Please log in"}
    end
  end

  def me
    @student = current_student

    render json: { first_name: @student.first_name, last_name: @student.last_name, username: @student.username, email: @student.email, location: @student.location, subjects: @student.subjects, tutors: @student.tutors.map { |tutor| {id: tutor.id, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, email: tutor.email }  }, not_selected_tutors: Tutor.all.select{ |tutor| !@student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase} }}}
  end

  def student_tutor
    @student = current_student
    @tutor = Tutor.find_by({id: params[:tutor_id]})
    Studentstutor.create({student_id: @student.id, tutor_id: @tutor.id})
    render json: { first_name: @student.first_name, last_name: @student.last_name, username: @student.username, email: @student.email, location: @student.location, subjects: @student.subjects, tutors: @student.tutors.map { |tutor| {id: tutor.id, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, email: tutor.email }  }, not_selected_tutors: Tutor.all.select{ |tutor| !@student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase} }}}
  end

  def students_subject
    @student = current_student
    @student.subject_ids = params[:subject_ids]

    render json: { first_name: @student.first_name, last_name: @student.last_name, username: @student.username, email: @student.email, location: @student.location, subjects: @student.subjects, tutors: @student.tutors.map { |tutor| {id: tutor.id, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, email: tutor.email }  }, not_selected_tutors: Tutor.all.select{ |tutor| !@student.tutors.include?(tutor)}.map{ |tutor| {id: tutor.id, email: tutor.email, first_name: tutor.first_name, last_name: tutor.last_name, subjects: tutor.subjects, subject_names: tutor.subjects.map{|subject| subject.name.downcase} }}, all_subjects: @student.subjects.to_json}
  end

  private

  def student_params
    params.require(:student).permit(:id, :first_name, :last_name, :username, :email, :password, :location_id)
  end

end
