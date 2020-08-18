Rails.application.routes.draw do
  root 'books#top'
  devise_for :users
  get '/about' => 'books#about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :users, only: [:index, :edit, :show, :update]
  resources :books
end
