Rails.application.routes.draw do
  resources :tasks
  resources :lists
  resources :users
  root 'dashboard#index', as: 'root'
end
