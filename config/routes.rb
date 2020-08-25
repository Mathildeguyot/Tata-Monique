Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :documents
  resources :tasks, only: [:index] do
    resources :subtask, only: [:edit, :update]
  end
  resources :subtask, only: [:show]
end
