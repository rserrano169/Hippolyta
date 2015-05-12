Rails.application.routes.draw do
  root to: "root#root"
  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  resources :queries, only: [:create]

  namespace :api, defaults: { format: :json } do
    resources :users, only: [:index, :show, :edit, :update] do
      resources :products, only: [:index, :show]
    end

    resources :queries, only: [:index]
    resources :carts, only: [:show]
    post "/cart_products/add/:product_id", to: "cart_products#add_to_cart"
    post "/cart_products/del/:product_id", to: "cart_products#delete_from_cart"
  end
end
