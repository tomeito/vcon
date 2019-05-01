Rails.application.routes.draw do
  get '/mr', to: 'entry_users#index'
  get '/ms', to: 'entry_users#index'
  get '/signout', to: 'sessions#destroy'
  get 'auth/twitter/callback', to: 'sessions#create'
  get '/votes', to: 'votes#create'
  resource :votes, only: [:create] do
    get 'confirm'
    post 'confirm'
  end
end
