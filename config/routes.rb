Rails.application.routes.draw do
	root to: "static_pages#home"
	
  resources :friendships, only: [:create, :update, :destroy]

  devise_for :users, path_names: { sign_up: "register" }
  
end
