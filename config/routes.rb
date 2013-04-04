Enrollments::Application.routes.draw do
  resources :people

  get 'thanks', to: 'thanks#index'

  root to: 'people#new'
end
