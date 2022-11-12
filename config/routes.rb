Rails.application.routes.draw do
  resources :registrations, only: [:index, :create]
  resources :sessions, only: [:index, :create]

  root to: 'posts#index'
end
