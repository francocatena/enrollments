Enrollments::Application.routes.draw do
  resources :people

  scope constraints: { email: /[^\/]+/ } do
    get 'registered/:id/:email', to: 'enrollments#show', as: 'registered'
    get 'thanks/:id/:email', to: 'thanks#index', as: 'thanks'
  end

  root to: 'people#new'
end
