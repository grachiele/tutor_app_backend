Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #  post '/login', to: 'api::v1::student_sessions#create'
  namespace :api do
    namespace :v1 do
      post '/student_subject', to: 'students#students_subject'
      post '/student_tutor', to: 'students#student_tutor'
      post '/tutor_student', to: 'tutors#tutor_student'
      post '/tutor_subject', to: 'tutors#tutors_subject'
      post '/remove_association_tutor', to: 'tutors#remove_association_tutor'
      post '/remove_association_student', to: 'students#remove_association_student'
      get '/student_information', to: 'students#me'
      get '/tutor_information', to: 'tutors#me'
      resources :student_sessions, only: [:create, :destroy]
      resources :tutor_sessions, only: [:create, :destroy]
      resources :students, :tutors, :locations, :subjects
    end
  end

end
