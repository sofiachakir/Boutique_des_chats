Rails.application.routes.draw do
  root :to => "items#index"
  get 'items/index'
  get 'items/view'
  devise_for :users
end
