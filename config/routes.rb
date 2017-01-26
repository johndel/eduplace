Rails.application.routes.draw do
  root to: "places#index"
  resources :counties
  resources :cities
  resources :edutypes
  resources :places
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
