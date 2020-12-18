Rails.application.routes.draw do
  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/login'
  get 'sessions/welcome'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  get 'welcome', to: 'sessions#welcome'
  get 'logout', to: 'sessions#logout'
  root 'posts#index'
  resources :posts
  resources :application
  resources :users
  resources :session, only: [:create]

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
