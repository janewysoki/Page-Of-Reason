Rails.application.routes.draw do
  
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create' 
  delete '/logout' => 'sessions#destroy'
  patch 'books/:id', to: 'books#update'
  patch 'reviews/:id', to: 'reviews#update'
  get '/auth/:provider/callback' => 'sessions#create'

  resources :reviews
  resources :books do
    resources :reviews, only: [:new, :index, :show]
  end
  resources :authors#, only: [:index, :show]
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
