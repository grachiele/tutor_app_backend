Rails.application.routes.draw do
  devise_for :tutors
  devise_for :students
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'welcome#home'

  namespace :api do
    namespace :v1 do

      resources :students, :tutors, :locations, :subjects
    end
  end

end
