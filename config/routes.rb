Enrollments::Application.routes.draw do
  resources :people

  root to: 'people#new'
end
