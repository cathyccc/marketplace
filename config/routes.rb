Rails.application.routes.draw do
  root 'products#index'

  resource :sessions, only: [:new,:create,:destroy]
  resource :users
  resources :products do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
