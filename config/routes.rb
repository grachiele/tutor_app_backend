Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  #  post '/login', to: 'api::v1::student_sessions#create'

  namespace :api do
    namespace :v1 do
      resources :student_sessions, only: [:create, :destroy]
      resources :students, :tutors, :locations, :subjects
    end
  end

end
