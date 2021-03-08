Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  get '/search', to: 'pages#search'

  resources :users, only: [:show]
  resources :projects, only: [:index, :show, :new, :create, :edit, :update] do
    resources :links, only: [:create]
    resources :comments, only: [:create]
    # resources :collaborations, only: [:create]
  end

  get '/projects/:project_id/collaborations', to: 'collaborations#create', as: :collaboration

  resources :cases do
    resources :patients, only: [:create]
  end
  resources :patients, only: [:edit, :update, :show]
end
