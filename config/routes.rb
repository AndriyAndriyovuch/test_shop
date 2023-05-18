Rails.application.routes.draw do
  resources :products
  resources :orders

  get 'buy', to: 'orders#create'

  delete 'delete/product/:id', to: 'product_orders#destroy', as: 'delete_product'

  root 'main#index'
end
