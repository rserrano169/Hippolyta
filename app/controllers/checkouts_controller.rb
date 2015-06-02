class CheckoutsController < ApplicationController

  def checkout
    if !signed_in?
      redirect_to "#must_sign_in"
    end
  end

  def update_quantity

  end

end
