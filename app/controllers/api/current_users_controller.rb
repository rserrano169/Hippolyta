class Api::CurrentUsersController < ApplicationController
  def show
    @current_user = current_user
    render :show
  end

  def cards
    if current_customer
      @cards = current_customer.sources.all(object: "card")
    else
      @cards = []
    end

    render :cards
  end
end
