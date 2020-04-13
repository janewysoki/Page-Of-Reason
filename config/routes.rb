Rails.application.routes.draw do
  
  get '/' => 'sessions#index'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  post '/signup' => 'users#create' #-- DO I NEED THIS?
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'

  resources :reviews
  resources :books do
    resources :reviews, only: [:new, :index]
  end
  resources :authors
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
