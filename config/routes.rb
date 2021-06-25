Rails.application.routes.draw do

  root to: 'homes#top'
  # 問い合わせフォーム用
  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: "/letter_opener"
  end

  devise_for :users
  get "home/about", to: "homes#about"
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    collection do
    get 'search'
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
    end
  end
  resources :genres, only: [:index, :create, :new, :show, :destroy]
  resources :users, only: [:index, :show, :new, :edit, :update] do
    # ネストさせる
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'

  end

  resources :contacts, only: [:new, :create]
  post 'contacts/confirm', to: 'contacts#confirm', as: 'confirm'
  post 'contacts/back', to: 'contacts#back', as: 'back'
  get 'done', to: 'contacts#done', as: 'done'


end
