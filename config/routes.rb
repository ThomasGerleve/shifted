Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :shifts, only: %i[index]
  get '/shifts/:year/:month/', to: 'shifts#index', as: :shifts_with_calendar
  get '/shifts/:calendar', to: 'shifts#index', as: :shifts_this_month_with_calendar
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'pages#dashboard'
  get '/profile', to: 'pages#profile'
  get '/users', to: 'users#index'
end
