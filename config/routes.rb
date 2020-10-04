Rails.application.routes.draw do
  devise_for :users
  root 'pages#index'
  get 'pages/show'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :blogs
  resources :users
end
