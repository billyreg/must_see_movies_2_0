Rails.application.routes.draw do
  resources :actors
  resources :filmographies
  resources :roles
  resources :directors
  devise_for :users
  resources :users
  resources :movies
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
