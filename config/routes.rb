Rails.application.routes.draw do
  root 'static_pages#home'
  resources :organizations
  resources :projects, only: [:index]
  get '/projects/get_projects', to: 'projects#get_project_from_jira'
end
