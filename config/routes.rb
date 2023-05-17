Rails.application.routes.draw do
  resources :products
  get 'buy', to: 'orders#create'
  get 'cart', to: 'orders#index'
  delete 'pay/:id', to: 'orders#destroy', as: 'pay_order'
  delete 'delete/product/:id', to: 'product_orders#destroy', as: 'delete_product'

  root 'main#index'
end
