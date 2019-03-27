Rails.application.routes.draw do

  root to: 'pages#home'
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show]
  resources :pages

  get 'search_results', to: 'searches#results', as: 'search_results'
  get 'ca/:permalink', to: 'pages#ca', as: 'permalink'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
