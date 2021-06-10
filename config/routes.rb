Rails.application.routes.draw do

  root to: 'homes#top'

  devise_for :users
  get "home/about", to: "homes#about"

  resources :posts, only: [:new, :create, :index, :show, :destroy]
  resources :genres, only: [:index, :create, :new, :show, :destroy]
  resources :users, only: [:index, :show, :new, :edit, :update]


end
