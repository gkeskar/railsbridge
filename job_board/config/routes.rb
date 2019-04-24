Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'tags/:tag', to: 'jobs#index', as: :tag
  resources :jobs
  root to: 'jobs#index'
  # get "jobs", to: "jobs#index"
  # get "jobs/new", to: "jobs#new"
  # post "jobs", to: "jobs#create"
  # get "jobs/:id/edit", to: "jobs#edit"

end
