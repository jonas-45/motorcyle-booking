Rails.application.routes.draw do
  mount Rswag::Ui::Engine => '/api-docs'
  mount Rswag::Api::Engine => '/api-docs'
  namespace :api do
    resources :motorcycles, only: [:index, :show, :create, :destroy]
    resources :users, only: [] do
      collection do
        post 'register', to: 'users#register'
        get 'login', to: 'users#login'
        get 'current_user_id', to: 'users#current_user_id'
      end
    end
    resources :reservations, only: [:index, :create, :destroy]
  end
end
