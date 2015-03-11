Rails.application.routes.draw do
  root to: "root#root"
  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :show]
    resources :products
  end
end
