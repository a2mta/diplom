Rails.application.routes.draw do
  resources :achivments, only: [:create, :destroy]

  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :users
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  root 'pages#index'
  get '/feed', :to => "users#feed"
  get '/achive_feed', :to => "users#achive_feed"
  match '/signup', to: 'users#new', via: 'get'
  get '/signin', :to => "sessions#new"
  get '/signout', :to => 'sessions#destroy'
end
