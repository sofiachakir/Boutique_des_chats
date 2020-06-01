Rails.application.routes.draw do

  root :to => "items#index"
  resources :items
  devise_for :users
  resources :users do
    resources :carts, only: [:show]
  end


end
