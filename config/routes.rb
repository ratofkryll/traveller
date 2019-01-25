Rails.application.routes.draw do

  root to: 'cities#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :edit]

  resources :trips, except: [:index]

  resources :itineraries, except: [:index]

  resources :cities, only: [:show, :index]

  resources :attractions, only: [:create, :edit, :update, :show] do
    resources :reviews, only: [:create]
  end

  resources :itineraryitems, only: [:create, :edit, :update, :show, :destroy]

  resources :reviews, only: [:destroy]

end
