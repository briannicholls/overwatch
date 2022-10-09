Rails.application.routes.draw do

  # TODO: the below commented routes should be made private
  if Rails.env.development?
    root 'overwatch#index'
    resources :abilities
    get 'teams/counter', to: 'teams#counter'
    resources :teams
    resources :roles
    resources :heros do
      resources :abilities
    end
    resources :hard_counters
  end

  # public API routes
  namespace :api do
    namespace :v1 do
      resources :users,     only: [ :create ]
      resources :api_keys,  only: [ :index, :create, :destroy ]
      resources :heros,     only: [ :index, :show ]
      resources :abilities, only: [ :index, :show ]
      resources :teams,     only: [ :index, :show, :create ]
    end
  end
end
