Rails.application.routes.draw do
  get 'reviews/show'

  get 'reviews/new'

  get 'reviews/create'

  get 'reviews/update'

  get 'reviews/delete'

  get 'users/new'

  get 'users/create'

  get 'users/edit'

  get 'users/update'

  get 'users/delete'

  get 'users/show'

  get 'products/new'

  get 'products/create'

  get 'products/edit'

  get 'products/update'

  get 'products/delete'

  get 'products/index'

  get 'products/show'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
