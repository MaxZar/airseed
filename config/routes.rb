Rails.application.routes.draw do
  resources :ideas do
    collection do
      get 'ideas/search/:q', to: 'ideas#search', as: 'search'
    end
  end
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
