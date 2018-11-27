Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :ideas do
    collection do
      get 'ideas/search/:q', to: 'ideas#search', as: 'search'
    end
    # member do
    # end
    resources :bookings, only: [:new, :create]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :bookings, only: [:show, :edit, :update]
end
