Rails.application.routes.draw do
  root to: 'pages#home'

  devise_for :users

  resources :projects do
    resources :collaborations, only: [:new, :create]
  end

  resources :cases do
    resources :patients, only: [:create]
  end
end
