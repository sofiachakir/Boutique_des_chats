Rails.application.routes.draw do
  
  root :to => "items#index"
  resources :items

  devise_for :users

  resource :user, only: [:show], path: 'mon_profil', as: 'profile'
  
  resource :cart, only: [:show], path: 'mon_panier'
  
  resources :orders, only: [:new, :create]  

  resources :cart_item_join, only: [:create, :destroy]

  namespace :admin do
    root to: 'orders#index'
    resources :items
  end

end
