Rails.application.routes.draw do
  get 'follows/index'
  get 'users/index', to: 'users#search'
  devise_for :users, controllers: { registrations: "registrations" }
  resources :tweets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html 
  authenticated :user do

    root :to => redirect("/home")
  end
  get '/', to: 'pages#index'

  get '/register', to: 'pages#register', as: 'register_path'
  get '/login', to: 'pages#login', as: 'login_path'
  get '/home', to: 'pages#home', as: 'home_path'
  get '/edit', to: 'pages#edit', as: 'edit_path'
  get '/profile', to: 'pages#profile', as: 'profile_path'
  post '/follow', to: 'follows#follow', as: 'follow'
  delete '/unfollow', to: 'follows#unfollow', as: 'unfollow'
  get '/followers', to: 'pages#followers', as: 'followers_path'
  get '/following', to: 'pages#following', as: 'following_path'
end
