Rails.application.routes.draw do
  resources :users, only: [:new, :create, :destroy]

  resource :session, only: [:new, :create, :destroy]
end
