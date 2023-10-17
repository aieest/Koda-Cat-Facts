Rails.application.routes.draw do
  resources :cat_facts, only: [:index, :create, :destroy]
  root 'cat_facts#index'
end
