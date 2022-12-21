Rails.application.routes.draw do
  root 'sessions#new', as: 'home'

  get '/users/new', to: 'users#new'
  get '/users/info_about_user', as: 'info_user'
  get '/users/edit', to: 'users#edit'
  post '/users/edit', to: 'users#update'
  post 'users/update'

  get '/gifts/show', as: 'wishlist'

  resource :user, only: %i[destroy update]
  resources :users, only: %i[new create update destroy]
  resources :gifts
  resource :session, only: %i[new create destroy]
  resources :users do
    member do
      get :confirm_email
    end
  end
end
