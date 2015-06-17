class Api::CurrentUsersController < ApplicationController
  def show
    @current_user = current_user
    render :show
  end

  def cards
    @cards = current_customer.sources.all(object: "card")
    render :cards
  end
end
