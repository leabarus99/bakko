Rails.application.routes.draw do
  devise_for :users

  root to: "trips#index"

  get "profil", to: 'pages#profil'
  get "journal", to: 'pages#journal'
  post "profil/follow", to: "pages#follow"
  delete "profil/unfollow", to: "pages#unfollow"
  get "all_stories", to: 'stories#all'
  get "journal", to: 'pages#destroy'
  get "journal", to: 'pages#destroyy'
  get "journal", to: 'pages#create'

  resources :trips do
    resources :stories, except: :show
    resources :guides
    resources :survival_articles

    resources :activities
    resources :budgets, only: [:new, :create, :show]
    member do
      get "detailedbudget", to: 'pages#detailedbudget'
    end
    member do
      get :equipments
    end
  end

  resources :stories, only: [:show] do
    resources :liikes, only: [:create]
  end

  resources :liikes, only: :destroy
  resources :guides
  resources :equipments
  resources :devise
  resources :relationships, only: [:create, :destroy]
  resources :users do
    get :followings, on: :member
    get :followers, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
