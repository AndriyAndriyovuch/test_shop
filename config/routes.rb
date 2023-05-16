Rails.application.routes.draw do
  resources :products
  root 'main#index'
end
