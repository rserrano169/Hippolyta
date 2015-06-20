Rails.application.routes.draw do
  root to: "root#root"
  resources :users, only: [:new, :create, :destroy]
  resource :session, only: [:new, :create, :destroy]
    post "session/demo", to: "sessions#demo_user_sign_in"
  resources :queries, only: [:create]
  get "checkout", to: "checkouts#checkout"
  post "checkout/add_card", to: "checkouts#add_card"
  post "checkout/add_purchased_products", to: "checkouts#add_purchased_products"
  post "checkout/select_card", to: "checkouts#select_card"

  namespace :api, defaults: { format: :json } do
    resource :current_user, only: [:show]
      get "current_user/cards", to: "current_users#cards"
    resources :users, only: [:index, :show, :edit, :update] do
      resources :products, only: [:index, :show]
    end
    resources :queries, only: [:index]
    resources :carts, only: [:show]

    resources :cart_products, only: [:show, :index]
      post "/cart_products/add/:product_id", to: "cart_products#add_to_cart"
      delete "/cart_products/del/:product_id", to: "cart_products#delete_from_cart"
      patch "/cart_products/qty/:product_id", to: "cart_products#update_quantity"
  end
end
