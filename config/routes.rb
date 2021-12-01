Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :shifts, only: %i[index]
  get '/shifts/calendar/:year/:month/', to: 'user_shifts#index', as: :shifts_with_calendar
  get '/shifts/calendar', to: 'user_shifts#index', as: :shifts_this_month_with_calendar
  resources :user_shifts, only: %i[show] do
    resources :messages, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/profile', to: 'pages#profile'
  resources :users, only: %i[index show]
end
