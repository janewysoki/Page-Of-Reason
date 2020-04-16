Rails.application.routes.draw do
  
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create' #-- DO I NEED THIS?
  delete '/logout' => 'sessions#destroy'
  #delete '/books/:id' => 'books#destroy', as: 'book'
  patch 'books/:id', to: 'books#update'
  patch 'reviews/:id', to: 'reviews#update'
  get '/auth/:provider/callback' => 'sessions#create'

  resources :reviews
  resources :books, only: [:index, :show, :new, :create, :edit, :update] do
    resources :reviews, only: [:new, :index]
  end
  resources :authors#, only: [index]
  resources :users, only: [:new, :create, :show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
