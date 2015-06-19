class Api::CurrentUsersController < ApplicationController
  def show
    @current_user = current_user
    render :show
  end

  def cards
    if current_stripe_customer
      @cards = current_stripe_customer.sources.all(object: "card")
    else
      @cards = []
    end

    render :cards
  end
end
