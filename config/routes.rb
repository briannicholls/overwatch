Rails.application.routes.draw do
  root to: 'application#index'
  resources :roles
  resources :heros
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
