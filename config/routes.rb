Rails.application.routes.draw do
  resources :events, only: [:index]
  devise_for :users
  root to: 'pages#home'
  get '/dashboard', to: 'dashboard#home'
  post 'update_avatar/:id', to: 'pages#update_avatar', as: 'avatar'

  resources :challenges do
    get 'renew', to: 'challenges#renew'
    get 'finished', to: 'challenges#finished'
    patch 'accept', to: 'challenges#accept'
    get 'schedule', to: 'challenges#schedule'
    post 'schedule', to: 'challenges#update_schedule'
    patch 'read', to: 'challenges#read'
    delete 'decline', to: 'challenges#decline'

    resources :check_ins, only: [:new, :create]
  end

  resources :accounts, only: [:show] do
    member do
      get 'friends', to: "accounts#friends"
      post 'request-friend', to: "accounts#request_friend"
      delete 'delete-friend', to: "accounts#delete_friend"
      post 'accept-friend', to: "accounts#accept_friend"
      delete 'decline-friend', to: "accounts#decline_friend"
      post 'update_avatar'
    end
  end

  resources :chat_rooms, only: [:show] do
    resources :messages, only: [:create]
  end

  mount ActionCable.server => '/cable'
end
