Rails.application.routes.draw do
  

 	root to: "home#index"

  resources :transactions
  resources :accounts
  resources :agencies
  # resources :usuarios

  devise_for :usuarios
end
