Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resource :users, only: [:new, :create, :edit, :show, :update]
  resource :owners, only: [:new, :create, :edit, :show, :update]
  resources :reservations
  resources :restaurants
  resource :sessions, only: [:new, :create, :destroy]

end
