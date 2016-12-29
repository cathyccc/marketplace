Rails.application.routes.draw do

  root 'main#index'

  get 'about' => 'main#about'

  get 'cart' => 'carts#show'
  post 'cart/add/:id' => 'carts#add', :as => 'cart_add'

  resources :cart
  resources :cart_products, only: [:create,:destroy]

  resource :sessions, only: [:new,:create,:destroy]
  resources :users
  resources :products do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
