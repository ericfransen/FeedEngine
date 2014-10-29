Rails.application.routes.draw do
  root 'welcome#index'
  resources :goals, only: [:index]
  resources :github_goals, only: [:new]
end
