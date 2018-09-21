# frozen_string_literal: true

Rails.application.routes.draw do
  root to: 'landing#index'

  devise_for :users

  resource :booking, only: %i[show] do
    resources :booking_items, only: %i[create show destroy] do
      collection do
        post :book_activity
      end
    end

    member do
      get :checkout
      get :personal_information
      post :confirmation
    end
  end

  resources :properties, only: %i[index show]
  resources :activities, only: %i[index show]
  resources :locations, only: %i[index show]

  namespace :admin do
    root to: 'properties#index'

    resources :activities
    resources :locations, except: %i[show]
    resources :bookings, only: %i[index show]

    resources :products, only: [] do
      resources :product_images
    end

    resources :properties do
      resources :room_types
    end
  end
end
