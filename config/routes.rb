Rails.application.routes.draw do
  get 'welcome/index'
  get 'welcome/about'

  root 'welcome#index'
  resources :registeredapps

  devise_for :users, controllers: { confirmations: 'confirmations' }
end
