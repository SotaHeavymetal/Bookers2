Rails.application.routes.draw do
  devise_for :users
  resources :books, only: [:new, :create, :index, :show, :edit, :destroy]
  root to: 'homes#top'
  get 'about'=>'homes#show'
  resources :users, only: [:show, :edit, :update]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
