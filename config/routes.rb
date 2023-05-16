Rails.application.routes.draw do
  resources :products
  get 'buy', to: 'orders#create'
  get 'cart', to: 'orders#index'

  root 'main#index'
end
