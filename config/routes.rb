Rails.application.routes.draw do

  get '/lists/public', to: 'lists#public_index'
  get '/lists/public/:id', to: 'lists#public_show'
  get '/lists/archived', to: 'lists#archived_index'

  resources :allaccesses
  resources :permissions
  resources :lists do
    member do
        get :flop
    end
  end
  resources :tasks
  resources :users, controller: "clearance/users"


  root 'dashboard#index', as: 'root'
end
