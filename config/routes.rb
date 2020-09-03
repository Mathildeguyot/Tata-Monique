Rails.application.routes.draw do

  devise_for :users
  root to: 'pages#home'
  resources :users, only: [:edit, :update] do
    resources :habitations, only: [:edit, :update]
  end
  resources :documents
  resources :tasks, only: [:index] do
    resources :subtasks, only: [:index, :edit, :update]
   end
  resources :usersubtasks, only: [:update]

  namespace :api, defaults: { format: :json } do
    namespace :v1 do
      resources :users, only: [ :index, :show, :update ] do
        resources :usersubtasks, only: [:update, :show]
      end
    end
  end

  post "/tasks/fetch_tasks", to: "tasks#fetch_tasks", as: :fetch_tasks
end

