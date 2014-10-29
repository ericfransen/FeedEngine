Rails.application.routes.draw do

  resources :goals, only: [:index]
  resources :github_goals, only: [:new]


end
