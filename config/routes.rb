Rails.application.routes.draw do

  root to: 'homes#top'

  devise_for :users
  get "home/about", to: "homes#about"

  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :genres, only: [:index, :create, :new, :show, :destroy]
  resources :users, only: [:index, :show, :new, :edit, :update] do
    resources :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end


end
