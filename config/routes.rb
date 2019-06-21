Rails.application.routes.draw do
  root 'books#index'

  devise_for :users, :controllers => {registrations: 'registrations', :omniauth_callbacks => 'callbacks' }

  resources :books do
    resources :reviews
  end

  get '/my_books', to: 'books#my_books'
  get '/my_reviews', to: 'reviews#my_reviews'
end
