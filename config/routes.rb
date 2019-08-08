Rails.application.routes.draw do
  root to: 'home#index'

  get '/team', to: 'static_pages#team'
  get '/contact', to: 'static_pages#contact'
  resources :gossips
  resources :users
  resources :cities
  resources :sessions, only: [:new, :create, :destroy]
end
