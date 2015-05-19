Rails.application.routes.draw do
  resources :sessions, :only => [:new, :create, :destroy]
  resources :users

  root 'pages#index'

  match '/signup',  to: 'users#new',            via: 'get'
  get '/signin',  :to => "sessions#new"
  get '/signout', :to => 'sessions#destroy'
end
