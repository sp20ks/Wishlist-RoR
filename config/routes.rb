Rails.application.routes.draw do
  root 'sessions#new', as: 'home'

  resources :gifts
  resources :friendships, only: %i[destroy]
  #delete '/friendships/:id', to: 'friendships#destroy', as: 'delete_req'
  get '/friendships/show'
  #get '/friendship/:id', to: 'friendships#destroy'


  get '/users/new', to: 'users#new'
  get '/users/info_about_user', as: 'info_user'
  post '/users/edit', to: 'users#edit'
  post 'users/update'
  get '/users/edit', to: 'users#edit'
  get '/users/show', to: 'users#show'
  post '/users/show_by_login'
  get '/users/:id', to: 'friendships#create'

  post '/friendships/in', to: 'friendships#in'
  post '/friendships/out', to: 'friendships#out'

  get '/gifts/show', as: 'wishlist'
  post '/gifts/create'

  get 'password/index', to: 'passwords#index'
  get 'password/new_password', to: 'passwords#new_password'
  post 'password/forgot', to: 'passwords#forgot'
  post 'password/reset', to: 'passwords#reset'
  put 'password/update', to: 'passwords#update'

  #resource :user, only: %i[destroy]

  resources :users
  #resource :gift, only: %i[destroy]
  resource :password, only: %i[update]
  resource :session, only: %i[new create destroy]
  resources :users do
    member do
      get :confirm_email
    end
  end

end
