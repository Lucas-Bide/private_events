Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resources :logins, only: [:new, :create]
end
