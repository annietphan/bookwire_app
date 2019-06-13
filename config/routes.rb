Rails.application.routes.draw do
  resources :books
  resources :clubs
  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => 'callbacks' }
  root to: 'application#welcome'
end
