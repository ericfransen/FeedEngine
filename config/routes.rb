Rails.application.routes.draw do
  root 'welcome#index'
  resources :goals, only: [:index]
  resources :github_goals


  namespace 'api' do
    namespace 'v1' do
      resources :github_goals, only: [:index, :show]
      resources :fitbit_goals, only: [:index, :show]
      resources :users, only: [:index, :show]
    end
  end


  get '/login'     => redirect('/auth/twitter'), as: :login
  get '/goodreads' => redirect('/auth/goodreads'), as: :new_goodread
  get '/fitbit' => redirect('/auth/fitbit'), as: :fitbit
  get '/github' => redirect('/auth/github'), as: :github
  get '/auth/goodreads/callback', to: 'goodreads#create'
  get '/auth/github/callback', to:'githubs#create'
  get '/logout' => 'sessions#destroy', as: :logout
  get '/auth/twitter/callback', to: 'sessions#create'
  get '/auth/failure', to: 'sessions#failure'
  get '/auth/fitbit/callback', to: 'fitbit#create'

end
