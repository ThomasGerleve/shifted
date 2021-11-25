Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  get '/dashboard', to: 'pages#dashboard'
  get '/profile', to: 'pages#profile'
end
