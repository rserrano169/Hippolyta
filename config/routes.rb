Rails.application.routes.draw do
  root to: "root#root"
  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :show, :edit, :update] do
      resources :products, only: [:index]
    end

    resources :products, except: [:index]

    post "/create_search", to: "root#create_search"
    get "/results", to: "root#results"
  end
end
