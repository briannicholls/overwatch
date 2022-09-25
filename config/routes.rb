Rails.application.routes.draw do
  root 'overwatch#index'
  
  resources :abilities

  # TODO: the below commented routes should be made private
  # get 'teams/counter', to: 'teams#counter'
  # resources :teams
  # resources :roles
  # resources :heros do
  #   resources :abilities
  # end
  # resources :hard_counters

  # public API routes
  namespace :api do
    namespace :v1 do
      resources :api_keys,  only: [ :index, :create, :destroy ]
      resources :heros,     only: [ :index, :show ]
      resources :abilities, only: [ :index, :show ]
      resources :teams,     only: [ :index, :show ]
    end
  end
end
