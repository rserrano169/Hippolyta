class Api::CartsController < ApplicationController

  def show
    @cart = Cart.find(params[:id])

    render :show
  end

  def delete_from_cart
    @cart = Cart.find(params[:id])
    @cart.products.delete(Product.find(params[:product_id]))

    redirect_to "#carts/#{@cart.id}"
  end

end
