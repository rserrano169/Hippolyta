class Api::CartsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])

    if current_user
      @cart = Cart.find_by(buyer_id: current_user.id)
    else
      @cart = Cart.find_by(session_token: session[:guest_token])
    end

    p "before"
    p @cart.products

    @cart.products << @product

    p "after"
    p @cart.products

    redirect_to root_url
  end

  def index

  end

  def update

  end

  def edit

  end

end
