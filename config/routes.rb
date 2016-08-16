Rails.application.routes.draw do

  resources :permissions
  resources :lists
  resources :tasks
  resources :users, controller: "clearance/users"
  root 'dashboard#index', as: 'root'
end
