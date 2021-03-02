Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'

  resources :cases do
    resources :patients, only: [:create]
  end
end
