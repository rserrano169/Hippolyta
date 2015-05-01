class Api::CartsController < ApplicationController

  def create
    @product = Product.find(params[:product_id])
    @cart = current_cart
    @cart.products << @product unless @cart.products.include?(@product)

    redirect_to root_url
  end

  def index

  end

  def update

  end

  def edit

  end

end
