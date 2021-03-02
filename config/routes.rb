Rails.application.routes.draw do
  devise_for :users
  resources :projects, only: [:index, :show, :new, :create, :edit, :update]
  root to: 'pages#home'

  resources :cases do
    resources :patients, only: [:create]
  end
end
