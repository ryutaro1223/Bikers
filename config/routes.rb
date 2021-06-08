Rails.application.routes.draw do
  get 'users/index'
  get 'users/show'
  devise_for :users
  
  
  root to: 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :destroy] 
  resources :genres, only: [:index, :create, :index, :new]
  resources :users, only: [:index, :show]
  
  
end
