Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:edit, :update]
  resources :documents
  resources :tasks, only: [:index] do
    resources :subtasks, only: [:index, :edit, :update]
   end
  resources :usersubtasks, only: [:update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index, :show ]
    end
  end

  post "/tasks/fetch_tasks", to: "tasks#fetch_tasks", as: :fetch_tasks
end

