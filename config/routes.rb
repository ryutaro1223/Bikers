Rails.application.routes.draw do
  devise_for :users
  root to: 'homes#top'
  resources :posts, only: [:new, :create, :index, :show, :destroy] 
  resources :genres, onlt: [:index, :create, :index, :new]
  
  
end
