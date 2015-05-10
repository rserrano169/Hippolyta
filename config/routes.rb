Rails.application.routes.draw do
  root to: "root#root"
  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :queries, only: [:create]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :show, :edit, :update] do
      resources :products, only: [:index, :show, :edit]
    end

    resources :queries, only: [:index]
    resources :carts, only: [:show, :edit, :update]
    patch "/products/:id", to: "products#add_to_cart"
  end
end
