class Api::CartProductsController < ApplicationController

  def add_to_cart
    @cart_product = CartProduct.find_by(
      cart_id: current_cart.id,
      product_id: params[:product_id]
    )

    if !@cart_product
      @cart_product = CartProduct.create({
        cart_id: current_cart.id,
        product_id: params[:product_id],
        quantity: 1
      })
    end

    redirect_to "#carts/#{current_cart.id}"
  end

  def delete_from_cart
    @cart_product = CartProduct.find_by(
      cart_id: current_cart.id,
      product_id: params[:product_id]
    )
    @cart_product.destroy

    redirect_to "#carts/#{current_cart.id}"
  end

end
