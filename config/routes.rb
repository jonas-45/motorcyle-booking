Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  #namespace :api do
  #get 'motorcycles', to: 'motorcycles#index'
  #end 
  # Defines the root path route ("/")
  # root "articles#index"
  resources :users, only: [] do
    resources :reservations, only: [:index, :create, :destroy]
  end
  resources :reservations, only: [:destroy]
  resources :motorcycles, only: [:index, :show, :create, :destroy]
end
