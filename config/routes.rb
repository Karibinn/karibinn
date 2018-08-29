Rails.application.routes.draw do
  root to: 'landing#index'

  devise_for :users

  resources :properties, only: %i[index show]
  resources :activities, only: %i[index show]

  namespace :admin do
    root to: 'products#index'

    resources :products do
      resources :product_images
    end
  end
end
