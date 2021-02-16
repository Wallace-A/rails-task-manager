Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # verb '/path', to: 'controller#action', as: :prefix
  # CRUD
  # Read All
  get '/tasks', to: 'tasks#index', as: :tasks
  # # Create
  # # One for the form
  get '/tasks/new', to: 'tasks#new', as: :new_task
  # # One for the creation
  post '/tasks', to: 'tasks#create'
  # # Read One
  get '/tasks/:id', to: 'tasks#show', as: :task

  # # Update
  get '/tasks/:id/edit', to: 'tasks#edit', as: :edit_task
  patch '/tasks/:id', to: 'tasks#update'

  # # Delete/Destroy
  delete '/tasks/:id', to: 'tasks#destroy'

  # # resources :restaurants
  # # You can't use these today
end
