Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :users, only: [:show]
  resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
    resources :links, only: [:create]
    resources :comments, only: [:create]
  end

  resources :cases do
    resources :patients, only: [:create]
  end
  resources :patients, only: [:edit, :update]
end
