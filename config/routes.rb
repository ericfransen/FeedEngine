Rails.application.routes.draw do
  root 'welcome#index'
  resources :goals, only: [:index]
  resources :github_goals 

  get '/login' => redirect('/auth/twitter'), as: :login
  get '/logout' => 'sessions#destroy', as: :logout
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'

end
