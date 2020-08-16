Rails.application.routes.draw do
  devise_for :users
  root 'post_images#new'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :edit]
end