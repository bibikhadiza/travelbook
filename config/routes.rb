Rails.application.routes.draw do

  resources :destinations, :posts
  post '/post/:id/edit' => "posts#edit", as: "edit_post_button"

  resources :pins, only: [:edit, :update]
  get '/destinations/:id/posts/new' => "posts#new"
  post '/users/:id/pins' => "pins#users"

  resources :posts, only: [:show] do
    resources :pins, only: [:create, :index]
  end


  get "/users/:id/pins" => "pins#index", as: "user_pins"
  post "/posts/:post_id/pins" => "pins#create", as: "user_post_pins"
  get "/posts/:type_of/inspiration" => "posts#type", as: "post_type"



  get '/users' => "users#index"
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" }
  get '/users/:id' => "users#show", as: "user"
  root to: "application#home"
end
