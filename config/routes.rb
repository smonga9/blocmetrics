Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'

  root 'welcome#index'
  resources :registeredapps

  namespace :api, defaults: { format: :json } do
  	match '/events', to: 'events#preflight', via: [:options]
  	resources :events, only: [:create]

  devise_for :users, controllers: { confirmations: 'confirmations' }
end
