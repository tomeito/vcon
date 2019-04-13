Rails.application.routes.draw do
  resources :entry_users, only: [:index, :show]
  resource :vote_users, only: [:create]
  resource :sessions, only: [:create, :destroy]
end
