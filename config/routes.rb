Enrollments::Application.routes.draw do
  resources :people

  get 'registered/:id/:email', to: 'enrollments#show', as: 'registered'
  get 'thanks/:id/:email', to: 'thanks#index', as: 'thanks'

  root to: 'people#new'
end
