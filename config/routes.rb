Rails.application.routes.draw do
  

 	root to: "home#index"

  resources :transactions
  resources :accounts
  resources :agencies
  devise_for :usuarios
end
