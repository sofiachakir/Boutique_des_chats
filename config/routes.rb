Rails.application.routes.draw do
  root :to => "items#index"
  resources :items

  devise_for :users
  resources :users do
    resources :carts, only: [:show, :update] do
      resources :orders, only: [:new, :create]
    end
  end

  resources :cart_item_join, only: [:create, :destroy]

  namespace :admin do
    root to: 'orders#index'
    resources :orders, only: [:index]
  end

end
