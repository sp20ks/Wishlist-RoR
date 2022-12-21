Rails.application.routes.draw do
  get 'user/edit'
  get 'gifts/show'
  get 'gifts/new'
  get 'gifts/destroy'
  get 'gifts/update'
  resource :session, only: %i[new create destroy]

  root 'sessions#new', as: 'home'
  get 'sessions/destroy', as: 'exit'
  get 'sessions/new'
  post 'sessions/create', as: 'new_sess'

  get 'users/new', as: 'new_us'
  get 'users/create'
  get 'users/info_about_user', as: 'info_user'
  post 'users/create', as: 'make_new_user'
  get 'users/edit', as: 'edit_user'
  get 'users/update', as: 'update'
  post 'users/update'

  get 'gifts/show', as: 'wishlist'
  resources :users do
    member do
      get :confirm_email
    end
  end
end
