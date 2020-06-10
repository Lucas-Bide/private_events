Rails.application.routes.draw do  
  resources :users, only: [:new, :create, :show, :update]
  resources :logins, only: [:new, :create]
  resources :events, only: [:index, :new, :create, :show]

  get '/logins/logout', to: 'logins#logout'
end
