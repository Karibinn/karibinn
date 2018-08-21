Rails.application.routes.draw do
  root to: 'landing#index'

  devise_for :users

  resources :products
end
