class Api::CurrentUsersController < ApplicationController
  def show
    @current_user = current_user
    render :show
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

  def current_card
    # if current_stripe_customer
    #   @card =
    # end
  end
end
