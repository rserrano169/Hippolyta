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
    set_current_customer(token)

    @customer_cards_last4s_to_brands, @cards, @card = {}, [], nil
    current_customer.sources.all(object: "card").each do |card|
      @customer_cards_last4s_to_brands[card.last4] = card.brand
      @cards << card
    end

    @this_card = current_customer.sources.create(source: token)
    if @customer_cards_last4s_to_brands[@this_card.last4] == @this_card.brand
      @cards.each do |card|
        if card.last4 == @this_card.last4 && card.brand == @this_card.brand
          @card = card
        end
      end
      @this_card.delete()
    else
      @card = @this_card
    end

    # if !current_user.stripe_card_ids.include?(@card.id)
    #   current_user.stripe_card_ids << @card.id
    # end

    redirect_to "/checkout#checkout/#{current_cart.id}"
  end

  private

  def set_current_customer(token)
    if current_customer
      @current_customer = current_customer
    else
      @current_customer = Stripe::Customer.create(
      source: token,
      email: current_user.email
      )
    end
    current_user.stripe_id ||= @current_customer.id
    current_user.save!
  end
end
