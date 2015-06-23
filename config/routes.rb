Rails.application.routes.draw do
  root to: "root#root"
  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
  post "session/demo", to: "sessions#demo_user_sign_in"
  resources :queries, only: [:create]
  get "checkout", to: "checkouts#checkout"
  post "checkout/add_address", to: "checkouts#add_address"
  post "checkout/select_address", to: "checkouts#select_address"
  post "checkout/add_card", to: "checkouts#add_card"
  post "checkout/select_card", to: "checkouts#select_card"
  post "checkout/add_purchased_products", to: "checkouts#add_purchased_products"

  namespace :api, defaults: { format: :json } do
    resource :current_user, only: [:show]
    get "current_user/cart", to: "current_users#cart"
    get "current_user/products", to: "current_users#products"
    get "current_user/addresses", to: "current_users#addresses"
    get "current_user/current_address", to: "current_users#current_address"
    get "current_user/cards", to: "current_users#cards"
    resources :users, only: [:index, :show, :edit, :update] do
      resources :products, only: [:new, :create, :show]
    end
    resources :queries, only: [:index]
    resources :cart_products, only: [:show, :index]
    post "/cart_products/add/:product_id", to: "cart_products#add_to_cart"
    delete "/cart_products/del/:product_id", to: "cart_products#delete_from_cart"
    patch "/cart_products/qty/:product_id", to: "cart_products#update_quantity"
  end
end
