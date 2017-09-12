Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'welcome#index'

  resource :users, only: [:new, :create, :edit, :update]
  resource :owners, only: [:new, :create, :edit, :update]
  resources :reservations
  resources :restaurants


end
