Rails.application.routes.draw do
  root to: "posts#index"
  
  resources :likes, only: [:create, :destroy]

  resources :posts

  resources :comments, only: [:create, :update, :destroy]


  resources :friendships, only: [:create, :update, :destroy]

  devise_for :users, controllers: {omniauth_callbacks: "users/omniauth_callbacks" }, path_names: { sign_up: "register" } 
  
  resources :users, only: [:show, :index] 


  
end
