Rails.application.routes.draw do

  resources :startover_lists
  get '/about', to: 'dashboard#about'
  get '/lists/public', to: 'lists#public_index'
  get '/lists/public/:id', to: 'lists#public_show'
  get '/lists/archived', to: 'lists#archived_index'
  get '/lists/fiveoutoffive', to: 'lists#five_index'
  get '/lists/fouroutoffive', to: 'lists#four_index'
  get '/lists/threeoutoffive', to: 'lists#three_index'
  get '/lists/twooutoffive', to: 'lists#two_index'
  get '/lists/oneoutoffive', to: 'lists#one_index'

  resources :allaccesses
  resources :permissions
  resources :lists do
    member do
        get :flop
    end
  end
  resources :tasks
  resources :users, controller: "clearance/users"

  get :search, controller: 'search', as: 'search'
  root 'dashboard#index', as: 'root'
end
