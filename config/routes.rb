Rails.application.routes.draw do
  resources :abilities
  resources :teams

  root to: 'overwatch#index'
  resources :roles

  resources :heros do 
    resources :abilities
  end

  resources :hard_counters
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
