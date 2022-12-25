Rails.application.routes.draw do
  get 'wishlist_types/create'
  get 'wishlist_types/new'
  get 'wishlist_types/destroy'
  root 'sessions#new', as: 'home'

  #resource :friendship, only: %i[destroy]
  delete '/friendship/:id', to: 'friendships#destroy'

  resources :friendships
  get '/friendships/show'
  post '/friendships/in', to: 'friendships#in'
  post '/friendships/out', to: 'friendships#out'

  post '/friendships/:id', to: 'friendships#accept'
  get '/users/new', to: 'users#new'
  get '/users/info_about_user', as: 'info_user'
  post '/users/edit', to: 'users#edit'
  post 'users/update'
  get '/users/edit', to: 'users#edit'
  get '/users/show', to: 'users#show'
  post '/users/show_by_login'
  get '/users/:id', to: 'friendships#create'


  get '/gifts/set_giver/:id', to: 'gifts#set_giver', as: 'giver'
  get '/gifts/remove_giver/:id', to: 'gifts#remove_giver', as: 'remove_giver'
  get '/gifts/show/:id',to:'gifts#show' , as: 'wishlist'
  post '/gifts/show/:id',to:'gifts#show_with_type' , as: 'wishlist_with_type'
  get 'gifts/giver_presents'
  post '/gifts/create'
  resources :gifts  


  get 'password/index', to: 'passwords#index'
  get 'password/new_password', to: 'passwords#new_password'
  post 'password/forgot', to: 'passwords#forgot'
  post 'password/reset', to: 'passwords#reset'
  put 'password/update', to: 'passwords#update'

  #resource :user, only: %i[destroy]

  get '/wishlist_types/show', to: 'wishlist_types#show'
  post '/wishlist_types/create', to: 'wishlist_types#create'

  resources :wishlist_types
  resource :wishlist_type, only: %i[destroy]
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
