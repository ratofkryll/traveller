Rails.application.routes.draw do

  resources :todos
  devise_for :users
  root to: 'cities#index'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  resources :users, only: [:new, :create, :edit] do
    resources :trips
  end

  resources :trips, except: [:index] do
    resources :invites, only: [:create, :new, :show]
    resources :user_trips, only: [:create, :new]
    resources :itineraries, only: [:new, :create, :destroy]
  end

  resources :itineraries, except: [:index] do
    resources :itinerary_items, only: [:show]
  end

  resources :itinerary_items

  resources :cities, only: [:show, :index]

  resources :attractions, only: [:show] do
    resources :reviews, only: [:create]
    resources :itinerary_items, only: [:create, :new]
  end

  resources :reviews, only: [:destroy]

  namespace :admin do
    resources :attractions, except: [:show]
    resources :cities, except: [:show]
  end

  mount ActionCable.server => '/cable'

end
