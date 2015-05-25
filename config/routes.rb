Rails.application.routes.draw do
  resources :sessions, :only => [:new, :create, :destroy]
  resources :microposts, only: [:create, :destroy]
  resources :users do
    member do
      get :following, :followers
    end
  end
  resources :relationships, only: [:create, :destroy]
  root 'pages#index'

  match '/signup', to: 'users#new', via: 'get'
  get '/signin', :to => "sessions#new"
  get '/signout', :to => 'sessions#destroy'
end
