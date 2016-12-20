Rails.application.routes.draw do

  root 'main#index'

  get 'about' => 'main#about'

  get 'cart' => 'purchases#show'

  resource :sessions, only: [:new,:create,:destroy]
  resources :users
  resources :products do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
