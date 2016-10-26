Rails.application.routes.draw do

  resources :destinations
  post '/destinations/:id/edit' => "destinations#edit"
  resources :pins, only: [:edit]
  # resources :posts, only: [:show]
  get '/destinations/:id/new' => "destinations#new"

  post '/users/:id/pins' => "pins#users"

  resources :posts, only: [:show] do
    resources :pins, only: [:new, :index]
  end

  # resources :users, only: [:show] do
  #   resources :pins, only: [:index]
  # end

  get "/users/:id/pins" => "pins#index", as: "user_pins"




  get '/users' => "users#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  root to: "application#home"
end
