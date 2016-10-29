Rails.application.routes.draw do
  get 'sessions/new'

  get 'sessions/create'

  root 'products#index'
  resource :users
  resources :products do
    resources :reviews
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
