Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :documents
  resources :tasks, only: [:index,:show] do
    resources :subtask, only: [:index, :edit, :update]
  end
end
