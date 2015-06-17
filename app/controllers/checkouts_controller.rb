class CheckoutsController < ApplicationController

  def checkout
    if !signed_in?
      redirect_to "#must_sign_in"
    end
  end

  def add_purchased_products
    @cart_products = current_user.cart_products
    @cart_products.each do |cart_product|
      PurchasedProduct.create!({
        buyer_id: current_user.id,
        product_id: cart_product.product_id,
        quantity: cart_product.quantity
      })
    end

    current_cart.destroy

    redirect_to "/checkout#checkout_placed"
  end

  def add_card
    token = params[:stripeToken]
    current_customer = Stripe::Customer.create(
      source: token,
      email: current_user.email
    )
    p customer.id
    # current_user.stripe_id = current_customer.id

    redirect_to "/checkout#checkout/#{current_cart.id}"
  end
end
