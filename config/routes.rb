Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  get "profil", to: 'pages#profil'
  get "journal", to: 'pages#journal'

  resources :devise
  resources :budgets
  resources :equipments
  resources :stories
  resources :survival_articles
  resources :activities
  resources :trips

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
