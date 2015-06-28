class CheckoutsController < ApplicationController
  def checkout
    if !signed_in?
      redirect_to "/#must_sign_in"
    end
    if current_cart && current_cart.products.empty?
      redirect_to "/#cart"
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

  def add_address
    @address = Address.new(address_params)
    current_user.addresses << @address
    if current_user.save
      current_user.current_shipping_address_id = @address.id
      if params[:set_as_default] = "true"
        current_user.default_shipping_address_id = @address.id
      end
      current_user.save!

      redirect_to "/checkout#checkout"
    else
      redirect_to "/checkout#checkout"
    end
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
      current_user.stripe_id = @current_stripe_customer.id
    end
    if params[:set_as_default] == "true"
      current_user.stripe_default_card_id = @card.id
    end
    current_user.save!

    set_stripe_customer_default_source(@card.id)

    redirect_to "/checkout#checkout"
  end

  def select_address
    @user = current_user
    @user.current_shipping_address_id = params[:addressId]
    @user.save!

    redirect_to "/checkout#checkout"
  end

  def select_card
    set_stripe_customer_default_source(params[:cardId])

    redirect_to "/checkout#checkout"
  end

  private

  def address_params
    params.require(:address).permit(:name, :street, :apt, :city, :state, :zip)
  end

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
    if (
      @customer_cards_info[@this_card.last4] &&
      @customer_cards_info[@this_card.last4][1,4] == [
        @this_card.brand,
        @this_card.exp_month,
        @this_card.exp_year,
        @this_card.name
      ]
    )
      @card = @customer_cards_info[@this_card.last4][0]
      @this_card.delete()
    else
      @card = @this_card
    end

    @card
  end

  def set_stripe_customer_default_source(card_id)
    @current_stripe_customer = current_stripe_customer
    @current_stripe_customer.default_source = card_id
    @current_stripe_customer.save
  end
end
