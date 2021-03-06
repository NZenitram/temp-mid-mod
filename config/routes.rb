Rails.application.routes.draw do
  root to: "links#index"

  resources :links, only: [:index]

  resources :users

  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  post 'logout', to: 'sessions#destroy'


  namespace :api do
    namespace :v1 do
      resources :links, only: [:update]
    end
  end
end
