Rails.application.routes.draw do

  get '/lists/public', to: 'lists#public_index'
  get '/lists/public/:id', to: 'lists#public_show'

  resources :allaccesses
  resources :permissions
  resources :lists
  resources :tasks
  resources :users, controller: "clearance/users"


  root 'dashboard#index', as: 'root'
end
