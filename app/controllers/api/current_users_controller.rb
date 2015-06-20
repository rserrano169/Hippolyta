class Api::CurrentUsersController < ApplicationController
  def show
    @current_user = current_user
    render :show
  end

  def cards
    if current_stripe_customer
      begin
        @cards = current_stripe_customer.sources.all(object: "card")
      rescue Stripe::APIConnectionError
        fail
      end
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
