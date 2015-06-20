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
    if current_stripe_customer
      @card = delete_if_duplicate(token)
    else
      @current_stripe_customer = Stripe::Customer.create(
        source: token,
        email: current_user.email
      )
      @card = @current_stripe_customer.sources.all(object: "card").data.last
    end

    p "before default_source"
    p @current_stripe_customer.default_source

    if params[:set_as_default] == "true"
      @current_stripe_customer.default_source = @card.id
    end

    p "after default_source"
    p @current_stripe_customer

    current_user.stripe_id ||= @current_stripe_customer.id
    # current_user.current_card ||= @card
    current_user.save!

    redirect_to "/checkout#checkout/#{current_cart.id}"
  end

  def select_card
    p "params"
    p params
    @card_id = params[:cardId]
    p @card_id

    redirect_to "/checkout#checkout/#{current_cart.id}"
  end

  private

  def delete_if_duplicate(token)
    @customer_cards_info, @card = {}, nil
    current_stripe_customer.sources.all(object: "card").each do |card|
      @customer_cards_info[card.last4] = [
        card,
        card.brand,
        card.exp_month,
        card.exp_year,
        card.name
      ]
    end

    @this_card = current_stripe_customer.sources.create(source: token)
    if @customer_cards_info[@this_card.last4][1,4] == [
      @this_card.brand,
      @this_card.exp_month,
      @this_card.exp_year,
      @this_card.name
    ]
      @card = @customer_cards_info[@this_card.last4][0]
      @this_card.delete()
    else
      @card = @this_card
    end

    @card
  end
end
