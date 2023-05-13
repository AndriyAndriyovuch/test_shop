Rails.application.routes.draw do
  root 'main#index'
  
  get 'about', to: 'main#about'
end
