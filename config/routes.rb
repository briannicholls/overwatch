Rails.application.routes.draw do
  root to: 'overwatch#index'
  
  resources :abilities

  # Teams
  get 'teams/counter', to: 'teams#counter'
  resources :teams

  resources :roles

  resources :heros do 
    resources :abilities
  end

  resources :hard_counters
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
