Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :projects do
    resources :collaborations, only: [:create, :index]
  end

  resources :cases do
    resources :patients, only: [:create]
  end
end
