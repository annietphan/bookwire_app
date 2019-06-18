Rails.application.routes.draw do
  resources :books do
    resources :reviews
  end
  root 'books#index'

  get '/my_books', to: 'books#my_books'

  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => 'callbacks' }
  root to: 'application#welcome'
end
