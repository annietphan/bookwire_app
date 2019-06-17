Rails.application.routes.draw do
  resources :books
  root 'books#index'

  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => 'callbacks' }
  root to: 'application#welcome'
end
