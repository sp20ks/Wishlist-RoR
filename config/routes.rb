Rails.application.routes.draw do
  resource :session, only: %i[new create destroy]
  resources :users

  root 'sessions#create', as: 'home'
  get 'sessions/destroy', as: 'exit'
  get 'sessions/create'
end
