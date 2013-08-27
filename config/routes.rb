Enrollments::Application.routes.draw do
  resources :people do
    patch :confirm, on: :member
  end

  scope constraints: { email: /[^\/]+/ } do
    get 'registered/:id/:email', to: 'enrollments#show', as: 'registered'
    get 'thanks/:id/:email', to: 'thanks#index', as: 'thanks'
  end

  devise_for :users
  resources :users

  root to: 'people#new'
end
