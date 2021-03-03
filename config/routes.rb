Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :projects do
    resources :collaborations, only: [:create, :index]
    resources :links, only: [:create]
  end

  resources :users, only: [:show]
  resources :cases do
    resources :patients, only: [:create]
  end
  resources :patients, only: [:edit, :update]
end
