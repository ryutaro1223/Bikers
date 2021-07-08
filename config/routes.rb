Rails.application.routes.draw do

  root to: 'homes#top'
  # 問い合わせフォーム用

  mount LetterOpenerWeb::Engine, at: "/letter_opener"


  devise_for :users
  get "home/about", to: "homes#about"
  resources :posts, only: [:new, :create, :index, :show, :destroy] do
    collection do
    get 'search'
    end
    resource :favorites, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end
  resources :genres, only: [:index, :create, :new, :show, :destroy]
  resources :users, only: [:index, :show, :new, :edit, :update]


  resources :contacts, only: [:new, :create,] do
    collection do
      post 'confirm'
      post 'back'
      post 'done'
    end
  end

end
