Rails.application.routes.draw do
  resources :reviews
  resources :books
  # resources :clubs do
  #   resources :books, only: [:index, :new, :create]
  # end

  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => 'callbacks' }
  root to: 'application#welcome'
end
