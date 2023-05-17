Rails.application.routes.draw do
  resources :products
  get 'buy', to: 'orders#create'
  get 'cart', to: 'orders#index'
  delete 'pay/:id', to: 'orders#destroy', as: 'pay_order'

  root 'main#index'
end
