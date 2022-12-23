Rails.application.routes.draw do
  get 'friendships/new'
  get 'friendships/destroy'
  root 'sessions#new', as: 'home'

  resources :gifts

  get '/users/new', to: 'users#new'
  get '/users/info_about_user', as: 'info_user'
  post '/users/edit', to: 'users#edit'
  post 'users/update'
  get '/users/edit', to: 'users#edit'
  get '/users/show', to: 'users#show'
  post '/users/show_by_login'
  get '/users/:id', to: 'friendships#create'

  delete '/users/show/:id', to: 'friendships#destroy'

  #get '/frienships/:id', to: 'friendships#delete'


  get '/gifts/show', as: 'wishlist'
  #get '/gifts/new'
  post '/gifts/create'

  get 'password/index', to: 'passwords#index'
  get 'password/new_password', to: 'passwords#new_password'
  post 'password/forgot', to: 'passwords#forgot'
  post 'password/reset', to: 'passwords#reset'
  put 'password/update', to: 'passwords#update'

  #resource :user, only: %i[destroy]

  resources :users
  resources :gifts
  resources :friendships
  #resource :gift, only: %i[destroy]
  resource :password, only: %i[update]
  resource :session, only: %i[new create destroy]
  resources :users do
    member do
      get :confirm_email
    end
  end

end
