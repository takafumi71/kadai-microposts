Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get "login", to: "sessions#new"
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  get 'signup', to: 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    member do
      get :followings
      get :followers
      get :add_favorite_posts
    end
  end
  
  resources :microposts, only: [:create, :destroy] do
    member do
      get :added_favorite_posts
    end
  end
  
  resources :relationships, only: [:create, :destroy]
  
  get "favorites", to: "favorites#index"
end