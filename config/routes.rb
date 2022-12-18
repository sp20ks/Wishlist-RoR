Rails.application.routes.draw do
  get 'gifts/show'
  get 'gifts/new'
  get 'gifts/destroy'
  get 'gifts/update'
  resource :session, only: %i[new create destroy]
  resources :users

  root 'sessions#new', as: 'home'
  get 'sessions/destroy', as: 'exit'
  get 'sessions/new'
  get 'sessions/create'

  get 'users/new', as: 'new_us'
  get 'users/create'

  post 'users/create', as: 'make_new_user'
  get 'gifts/show', as: 'wishlist'
  resources :users do
    member do
      get :confirm_email
    end
  end
end
