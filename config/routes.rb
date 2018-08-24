Rails.application.routes.draw do
  root to: 'landing#index'

  devise_for :users

  resources :properties, only: %i[index show]

  namespace :admin do
    root to: 'products#index'

    resources :products
  end
end
