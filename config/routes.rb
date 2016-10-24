Rails.application.routes.draw do

  resources :destinations
  post '/destinations/:id/edit' => "destinations#edit"
  resources :pins
  resources :posts
  get '/destinations/:id/new' => "destinations#new"
  # post "/destinations/:id" => "destinations#update", :as => destination_post

  # resources :destinations, only: [:show] do
  #   resources :posts, only: [:edit]
  # end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


  root to: "application#home"
  get '/users' => "users#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
end
