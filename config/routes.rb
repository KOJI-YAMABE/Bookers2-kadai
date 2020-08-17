Rails.application.routes.draw do
  devise_for :users
  get '/about', to: 'books#about'
  root'books#top'
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:new, :index, :edit, :show, :update]
end
