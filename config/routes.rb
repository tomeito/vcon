Rails.application.routes.draw do
  resources :entry_users, only: [:index, :show]
  resource :vote_users, only: [:create, :update]
  resource :sessions, only: [:create, :destroy]

  get 'auth/twitter/callback' => 'sessions#create'
end
