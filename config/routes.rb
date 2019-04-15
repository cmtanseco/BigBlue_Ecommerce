Rails.application.routes.draw do

  devise_for :customers
  ##devise_for :users
  root to: 'pages#home'
  resources :categories, only: [:index, :show]
  resources :products, only: [:index, :show] do
    member do
      post :add_to_cart
      post :remove_from_cart
      post :update_cart
    end
    collection do
      post :clear_cart
    end
  end
  resources :pages

  get 'search_results', to: 'searches#results', as: 'search_results'
  get 'ca/:permalink', to: 'pages#ca', as: 'permalink'
  get 'cart', to: 'pages#cart', as: 'cart'

  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
