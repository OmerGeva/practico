Rails.application.routes.draw do
  resources :events, only: [:index]
  devise_for :users
  root to: 'dashboard#home'
  resources :challenges
  resources :accounts, only: [:show] do
    member do
      get 'friends', to: "accounts#friends"
      post 'request-friend', to: "accounts#request_friend"
      post 'delete-friend', to: "accounts#delete_friend"
      post 'accept-friend', to: "accounts#accept_friend"
    end
  end

end
