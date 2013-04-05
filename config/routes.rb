Enrollments::Application.routes.draw do
  resources :enrollments, only: [:show]
  resources :people

  get 'thanks', to: 'thanks#index'

  root to: 'people#new'
end
