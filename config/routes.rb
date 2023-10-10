Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  root "flights#index"

  get '/index', to: "flights#index"
  get '/bookings', to: "bookings#new"
  resources :flights, only: %i[index]
  resources :bookings, only: %i[show new create]
end
