Rails.application.routes.draw do
  devise_for :users
  resources :cat_facts, only: [:index, :create, :destroy]
  root 'cat_facts#index'
end
