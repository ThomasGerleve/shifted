Rails.application.routes.draw do
  devise_for :users

  root to: 'pages#home'
  resources :shifts, only: %i[index]
  get '/shifts/:year/:month', to: 'shifts#index', as: :shifts_with_calendar_path
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  get '/dashboard', to: 'pages#dashboard'
end
