Rails.application.routes.draw do

  root to: 'overwatch#index'
  resources :roles
  resources :heros

  resources :hard_counters
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
