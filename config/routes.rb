Rails.application.routes.draw do
  root to: 'users#index'

  resources :users, only: [:index, :new, :create, :show, :edit, :update]
  resources :libraries, only: [:index, :new, :create]
  ##########################
  # equivalent to:
  # get '/users/new', to: 'users#new', as: 'new_user'
  # get '/users', to: 'users#index'
  # post '/users', to: 'users#create'
  # get '/users/:id/edit', to: 'users#edit' as 'edit_user'
  # patch '/users/:id', to: 'users#update'
  # get '/users/:id', to: 'users#show', as: 'user'
  # get '/libraries', to: 'libraries#index'
  # get '/libraries/new', to 'libraries#new', as: 'new_library'
  # post '/libraries', to: 'libraries#create'
  ##########################
  get '/login', to: 'sessions#new'
  get '/logout', to: 'sessions#destroy'
  post '/sessions', to: 'sessions#create'

end
