Rails.application.routes.draw do
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  resources :reviews
  resources :books
  resources :authors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
