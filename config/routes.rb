Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#home'
  resources :challenges do
    patch 'accept', to: 'challenges#accept'
    delete 'decline', to: 'challenges#decline'
  end

  resources :accounts, only: [:show] do
    member do
      get 'friends', to: "accounts#friends"
      post 'request-friend', to: "accounts#request_friend"
      post 'delete-friend', to: "accounts#delete_friend"
      post 'accept-friend', to: "accounts#accept_friend"
    end
  end

end
