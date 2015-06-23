class Api::CurrentUsersController < ApplicationController
  def show
    @current_user = current_user
    render :show
  end

  def products
    @products = current_user.products

    render :products
  end

  def cart
    @cart = current_cart

    render :cart
  end

  def addresses
    @addresses = current_user.addresses

    render :addresses
  end

  def current_address
    @current_address = current_user.current_shipping_address

    render :current_address
  end

  def cards
    if current_stripe_customer
      default_card_id = current_user.stripe_default_card_id
      current_card_id = current_stripe_customer.default_source
      @default_card = current_stripe_customer.sources.retrieve(default_card_id)
      @current_card = current_stripe_customer.sources.retrieve(current_card_id)
      @cards = current_stripe_customer.sources.all(object: "card")
    else
      @cards = []
    end

    render :cards
  end
end
