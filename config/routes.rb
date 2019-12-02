Rails.application.routes.draw do
  devise_for :users
  root to: 'dashboard#home'
  resources :challenges do
    resources :check_ins, only: [:new]
  end
  resources :accounts, only: [:show] do
    member do
      get 'friends', to: "accounts#friends"
      post 'request-friend', to: "accounts#request_friend"
      delete 'delete-friend', to: "accounts#delete_friend"
      post 'accept-friend', to: "accounts#accept_friend"
    end
  end

  resources :chat_rooms, only: [:show] do
    resources :messages, only: [:create]
  end

  mount ActionCable.server => '/cable'
end
