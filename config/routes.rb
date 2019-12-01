Rails.application.routes.draw do
  get 'dashboard/home'
  devise_for :users
  root to: 'dashboard#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
