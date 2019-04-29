Rails.application.routes.draw do
  get '/mr', to: 'entry_users#index'
  get '/ms', to: 'entry_users#index'
  resource :vote_users, only: :create
  resource :sessions, only: [:create, :destroy]
end
