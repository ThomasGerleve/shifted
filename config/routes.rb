Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :shifts, only: %i[index]
  get '/shifts/calendar/:year/:month/', to: 'user_shifts#index', as: :shifts_with_calendar
  get '/shifts/calendar', to: 'user_shifts#index', as: :shifts_this_month_with_calendar
  patch 'shifts/:id/offer', to: 'user_shifts#offer', as: :offer_shift
  get 'shifts/:id/retract_offer', to: 'user_shifts#retract_offer', as: :retract_offer
  get 'shifts/:id/accept', to: 'user_shifts#accept', as: :accept_shift
  resources :user_shifts, only: %i[show] do
    resources :messages, only: :create
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/profile', to: 'pages#profile'
  resources :users, only: %i[index show]
end
