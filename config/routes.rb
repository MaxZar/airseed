Rails.application.routes.draw do
  get 'users/show'
  get 'users/edit'
  get 'users/update'
  get 'users/destroy'
  get 'users/index'
  root to: 'ideas#index'

  devise_for :users

  resources :ideas do
    collection do
      get 'ideas/search/:q', to: 'ideas#search', as: 'search'
    end
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:edit, :update]
  resources :bookings, only: [:show] do
    resources :reviews, only: [:new, :create]
  end
  resources :bookings do
    member do
      patch :accept
      patch :decline
    end
  end
end
