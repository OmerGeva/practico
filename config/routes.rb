Rails.application.routes.draw do
  get 'dashboard/home'
  devise_for :users
  root to: 'dashboard#home'
  resources :challenges
end
