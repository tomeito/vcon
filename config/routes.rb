Rails.application.routes.draw do
  resources :entry_users, only: [:index, :show]
  resource :votes, only: :create
  resource :sessions, only: [:create, :destroy]

  get 'auth/twitter/callback' => 'sessions#create'
end
