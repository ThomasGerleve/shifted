Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/shifts/:year/:month', to: 'shifts#index', as: :shifts_with_calendar_path
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
