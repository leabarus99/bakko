Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "profil", to: 'pages#profil'
  get "journal", to: 'pages#journal'
  get "yourbudget", to: 'pages#yourbudget'

  resources :devise

  resources :trips do
    resources :stories
    resources :survival_articles
    resources :activities
  end

  resources :equipments
  resources :budgets
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
