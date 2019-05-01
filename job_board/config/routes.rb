Rails.application.routes.draw do
  devise_for :users
  get 'static_pages/home', to: 'jobs#index'

  get 'static_pages/help'

  get 'static_pages/about'

  get 'static_pages/contact'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'tags/:tag', to: 'jobs#index', as: :tag
  resources :jobs
  root to: 'jobs#index'
  # get "jobs", to: "jobs#index"
  # get "jobs/new", to: "jobs#new"
  # post "jobs", to: "jobs#create"
  # get "jobs/:id/edit", to: "jobs#edit"

end
