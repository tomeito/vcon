Rails.application.routes.draw do
  get '/mr', to: 'entry_users#index'
  get '/ms', to: 'entry_users#index'
  get '/signout', to: 'sessions#destroy'
  get 'auth/twitter/callback', to: 'sessions#create'
  post 'votes/confirm', to: 'votes#confirm'
  resource :votes, only: :create
end
