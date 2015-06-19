class Api::CartProductsController < ApplicationController
  def show
    @cart_product = CartProduct.find(params[:id])

    render :show
  end

  def index
    @cart_products = current_cart.cart_products

    render :index
  end

  def add_to_cart
    @cart_product = CartProduct.find_by(
      cart_id: current_cart.id,
      product_id: params[:product_id]
    )

    if !@cart_product
      @cart_product = CartProduct.create({
        cart_id: current_cart.id,
        product_id: params[:product_id],
        quantity: cart_product_params[:quantity]
      })
    else
      if cart_product_params[:quantity] == "0"
        @cart_product.destroy
      else
        new_qty = @cart_product.quantity + (cart_product_params[:quantity]).to_i
        if new_qty > @cart_product.product.quantity
          new_qty = @cart_product.product.quantity
        end
        @cart_product.update_attributes({ quantity: new_qty })
      end
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

  def update_quantity
    @cart_product = CartProduct.find_by(
      cart_id: current_cart.id,
      product_id: params[:product_id]
    )

    if cart_product_params[:quantity] == "0"
      @cart_product.destroy
    else
      @cart_product.update_attributes({
        quantity: cart_product_params[:quantity]
      })
    end

    if params[:checkout?] && params[:checkout?] == "true"
      redirect_to "/checkout#checkout/#{current_cart.id}"
    else
      redirect_to "#carts/#{current_cart.id}"
    end
  end

  private

  def cart_product_params
    params.require(:cart_product).permit(:quantity)
  end
end
