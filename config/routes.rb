Rails.application.routes.draw do

  root :to => "items#index"
  resources :items

  devise_for :users
  resources :users do
    resources :carts, only: [:show, :update]
  end
  resources :cart_item_join, only: [:create]

end
