Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :documents
  resources :tasks, only: [:index] do
    resources :subtasks, only: [:index]
    end
  resources :usersubtasks, only: [:edit, :update]
  end

