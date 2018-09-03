Rails.application.routes.draw do
  root to: 'landing#index'

  devise_for :users

  resource :booking, only: %i[] do
    member do
      post :add
    end
  end

  resources :properties, only: %i[index show]
  resources :activities, only: %i[index show]

  namespace :admin do
    root to: 'properties#index'

    resources :products, only: [] do
      resources :product_images
    end

    resources :activities
    resources :properties
  end
end
