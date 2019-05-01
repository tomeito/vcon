Rails.application.routes.draw do
  get '/mr', to: 'entry_users#index'
  get '/ms', to: 'entry_users#index'
  get '/signout', to: 'sessions#destroy'
  get 'auth/twitter/callback' => 'sessions#create'
  resource :votes, only: :create
  resource :votes do
    post :confirm
  end
end
