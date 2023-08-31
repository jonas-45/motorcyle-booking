Rails.application.routes.draw do
  namespace :api do
    resources :motorcycles, only: [:index, :show, :create, :destroy]
    resources :users, only: [] do
      collection do
        post 'register', to: 'users#register'
        get 'login', to: 'users#login'
      end
    end
    resources :reservations, only: [:index, :create, :destroy]
  end
end
