Rails.application.routes.draw do
  get 'users/new'
  resource :session, only: %i[new create destroy]
  resources :users

  root 'sessions#new', as: 'home'
  get 'sessions/destroy', as: 'exit'
  get 'sessions/new', as: 'new_sess'
  get 'sessions/create'

  get 'users/new', as: 'new_us'
end
