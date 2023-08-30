Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
   namespace :api do
    get 'motorcycles', to: 'motorcycles#index'
    get 'reservations', to: 'reservations#index'
  end 
  # Defines the root path route ("/")
  # root "articles#index"
end
