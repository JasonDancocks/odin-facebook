Rails.application.routes.draw do
  

  resources :posts

	root to: "posts#index"
	
  resources :friendships, only: [:create, :update, :destroy]

  devise_for :users, path_names: { sign_up: "register" } 
  
  resources :users, only: [:show, :index] 
  	
  
end
